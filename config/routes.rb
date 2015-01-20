Rails.application.routes.draw do

  devise_for :users
  root 'pages#home'

  get '/about' => 'pages#about'
  get '/volunteer' => 'volunteering#home'

  get '/volunteer/apply' => 'volunteering#apply'

end