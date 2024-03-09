Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # require "sidekiq/web"
  # authenticate :user, ->(user) { user.admin? } do
  #   mount Sidekiq::Web => '/sidekiq'
  # end

  resources :topics, only: %i[index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get 'users/choose_language_level', to: 'users#choose_language_level'
  post 'users/set_language_level', to: 'users#set_language_level'

  resources :conversations, only: %i[index show create] do
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

  resources :topics, only: [:index, :show]
  # This line generates routes for only the index and show actions of the conversations controller. This means you can display individual conversations (show) and list all conversations (index), but you cannot create new conversations or perform other actions.

  resources :conversations, only: [:index, :show]
  get 'choose_language_level', to: 'users#choose_language_level', as: 'choose_language_level'

  post "process_audio", to: "user_messages#process_audio"
end
