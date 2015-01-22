Rails.application.routes.draw do

  resources :volunteer_positions

  devise_for :users
  root 'pages#home'

  get '/about' => 'pages#about'

end