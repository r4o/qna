require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web =>'/sidekiq'
  
  use_doorkeeper
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  concern :commentable do
    resources :comments
  end

  resources :questions, concerns: :commentable, shallow: true do
    resources :answers, concerns: :commentable
  end

  namespace :api do
    namespace :v1 do
      resource :profiles do
        get :me, on: :collection
      end
      resources :questions
    end
  end

  root to: "questions#index"
end
