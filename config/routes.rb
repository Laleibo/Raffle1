Rails.application.routes.draw do
  root 'page#index'
  # root 'raffles#index'
  get '/secret' => 'page#secret'

  get '/register' => 'users#new'
  post '/register' => 'users#create'
  get '/users' => 'users#show'
  resources :users

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/confirm' => 'raffles#confirm'
  post '/winner/:raffle_id' => 'raffles#generate'
  


  resources :raffles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
