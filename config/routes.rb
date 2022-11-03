Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
  resources :users, only: [:index, :new, :create, :show] do
    resources :posts, only: [:index, :new, :create, :show] do
      resources :comments, only: [:create]
    end
  end  
end
