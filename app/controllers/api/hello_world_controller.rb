module Api
  class HelloWorldController < ApplicationController
    def index
      render json: { message: "Hello World" }
    end
  end
end
