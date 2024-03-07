Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :topics, only: %i[index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get 'users/choose_language_level', to: 'users#choose_language_level'
  post 'users/set_language_level', to: 'users#set_language_level'

  resources :conversations, only: %i[show create] do
    member do
      patch :end
    end

    member do
      get 'feedback', to: "conversations#feedback"
    end

    resources :user_messages, only: %i[create]
  end

  # Defines the root path route ("/")

  # root "posts#index"
end
