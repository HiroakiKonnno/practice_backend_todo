require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'バリデーション' do
    subject { task }

    let(:task) { Task.new(title: title) }

    context 'タイトルが有効な場合' do
      let(:title) {'タイトルのテスト'}
      it { is_expected.to be_valid }
    end

    context 'タイトルが空の場合' do
      let(:title) { nil }
      it { is_expected.to be_invalid}
      it 'エラーメッセージを返す' do
        task.valid?
        expect(task.errors[:title]).to include('タイトルを入力してください')
      end
    end

    context 'タイトルが2文字以下の場合' do
      let(:title) {'ts'}
      it { is_expected.to be_invalid }
      it 'エラーメッセージを返す' do
        task.valid?
        expect(task.errors[:title]).to include("タイトルは3文字以上256文字以内で入力してください")
      end
    end

    context 'タイトルが256文字以上の場合' do
      let(:title) {'t' * 256}
      it { is_expected.to be_invalid }
      it 'エラーメッセージを返す' do
        task.valid?
        expect(task.errors[:title]).to include("タイトルは3文字以上256文字以内で入力してください")
      end
    end
  end
end
