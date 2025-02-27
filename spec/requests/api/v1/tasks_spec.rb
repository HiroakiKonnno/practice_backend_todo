require 'rails_helper'

RSpec.describe "Api::V1::Tasks", type: :request do  
  describe "POST /api/v1/tasks" do
    let(:valid_params){{ task: { title: 'T' * 255, content: 'テスト内容' } }}
    let(:invalid_presence){{ task: { title: "", content: 'テスト内容' } }}
    let(:invalid_length){{ task: { title: "TS", content: 'テスト内容' } }}

    context '有効なパラメータの場合' do
      before { post "/api/v1/tasks", params: valid_params }

      it 'ステータスコード 201 を返す' do
        expect(response).to have_http_status(:created)
      end

      it '新しいタスクを JSON で返す' do
        json = JSON.parse(response.body)
        expect(json["title"]).to eq("T" * 255)
        expect(json["content"]).to eq("テスト内容")
      end
    end

    context 'タイトルが空の場合' do
      before { post "/api/v1/tasks", params: invalid_presence }

      it 'ステータスコード 422 を返す' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'エラーメッセージを JSON で返す' do
        json = JSON.parse(response.body)
        expect(json["errors"]).to include("タイトルを入力してください")
      end
    end

    context 'タイトルが2文字以下の場合' do
      before { post "/api/v1/tasks", params: invalid_length }

      it 'ステータスコード 422 を返す' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'エラーメッセージを JSON で返す' do
        json = JSON.parse(response.body)
        expect(json["errors"]).to include("タイトルは3文字以上256文字以内で入力してください")
      end
    end
  end
end
