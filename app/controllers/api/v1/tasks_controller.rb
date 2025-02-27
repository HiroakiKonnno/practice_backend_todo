module Api
  module V1
    class TasksController < ApplicationController
      # すべてのタスクの取得
      def index
      end

      # 詳細タスクの取得
      def show
      end

      # タスクの新規作成
      def create
        @task = Task.new(task_params)
        if @task.save
          render json: @task, serializer: TaskSerializer, status: :created
        else
          render json: {errors: @task.errors.messages[:title]}, status: :unprocessable_entity
        end
      end

      # タスクの更新
      def update
      end

      # タスクの削除
      def destroy
      end

      private
      def task_params
        params.require(:task).permit(:title, :content)
      end
    end
  end
end