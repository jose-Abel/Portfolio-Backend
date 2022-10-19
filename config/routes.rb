Rails.application.routes.draw do
  devise_for :users, defaults: { format: :json }
  root 'projects#index'
  resources :projects, only: %i[create index]
  resources :categories, only: %i[index create update destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
