module Api
  module V1
    class TasksController < ApplicationController

    def index
    end

    def show
    end

    def create
      task = Task.new(task_params)
      if task.save
        render json: task, serializer: TaskSerializer, status: :created
      else
        render json: {errors: task.errors.full_messages}, status: :unprocessable_entity
      end
    end

    def update
    end

    def destroy
    end

    private
    def task_params
      params.require(:task).permit(:title, :content)
    end
end