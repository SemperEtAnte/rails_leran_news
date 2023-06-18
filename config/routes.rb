Rails.application.routes.draw do
  mount Rswag::Api::Engine => '/api-docs'
  mount Rswag::Ui::Engine => '/api-docs'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :v1 do
    controller :user do
      post "user/login", action: :auth
      get "user/me", action: :me
      post "user", action: :register
    end
    controller :news do
      post "news", action: :create
      patch "news", action: :edit
      get "news", action: :list
      get "news/:id", action: :info
    end
  end
end
