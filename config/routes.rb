Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, :attractions
  # get '/users/welcome' => 'users#welcome'
  # post '/login' => 'sessions#create'
  # post '/logout' => 'sessions#destroy'
  root 'user#new'
end
