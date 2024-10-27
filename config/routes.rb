Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "home#top"
  resources :problems, only: [:index, :show] do
    resources :posts, only: [:show, :create, :destroy] do
      resources :likes, only: [:create, :destroy]
    end
  end
end
