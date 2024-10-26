Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "home#top"
  resources :problems, only: [:index, :show] do
    resources :posts, only: [:show, :create, :destroy]
  end
end
