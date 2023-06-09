Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/kitchen_sink", to: "pages#kitchen_sink"

  resources :concerts, only: [:index, :show] do
    resources :forums, only: [:index, :create, :show]
    resources :favorites, only: [:create]
  end

  resources :forums, only: :destroy do
    resources :comments, only: [:new ,:create]
  end

  resources :favorites, only: :destroy
  resources :comments, only: :destroy

  resources :chatrooms, only: [:show] do
    resources :messages, only: :create
  end


  post ':user_id/chatrooms', to: 'chatrooms#create', as: :chatrooms

  get "index", to: "user#index"

end
