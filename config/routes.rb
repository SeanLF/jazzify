Rails.application.routes.draw do

  resources :user_applications

  resources :volunteer_positions do
  	resources :user_applications, except: [:index]
	end

  devise_for :users
  root 'pages#home'
  get '/about' => 'pages#about'
  get 'permissions' => 'pages#permissions'

end