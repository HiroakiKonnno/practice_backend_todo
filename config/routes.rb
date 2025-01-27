Rails.application.routes.draw do
  namespace :api do
    get "helloworld", to: "hello_world#index"
  end
end
