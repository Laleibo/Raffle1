Rails.application.routes.draw do
  root 'page#index'
  # root 'raffles#index'
  get '/secret' => 'page#secret'

  get '/register' => 'users#new'
  post '/register' => 'users#create'
  resources :users

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/confirm' => 'raffles#confirm'
  get '/winner' => 'raffles#winner'


  resources :raffles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
