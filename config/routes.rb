Rails.application.routes.draw do

  resources :user_applications

  resources :volunteer_positions do
    resources :user_applications, except: [:index]
  end

  devise_for :users

  authenticate :user, lambda { |u| u.is_admin? } do
    mount Upmin::Engine => '/admin'
  end

  root 'pages#home'
  get '/about' => 'pages#about'
  get 'permissions' => 'pages#permissions'

end
