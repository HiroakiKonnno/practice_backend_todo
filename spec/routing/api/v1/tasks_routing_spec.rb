require 'rails_helper'

RSpec.describe Api::V1::TasksController, type: :routing do
  describe "ルーティングのテスト" do
    it "POST /api/vi/tasks" do
      expect(post: "/api/v1/tasks").to route_to(controller: "api/v1/tasks", action: "create")
    end
  end
end