Rails.application.routes.draw do
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post '/login', to: 'sessions#login'
  post '/signup', to: 'users#create'
  get '/me', to: 'users#show'
  get '/hello', to: 'application#hello_world'
  # Defines the root path route ("/")
  # root "articles#index"
end
