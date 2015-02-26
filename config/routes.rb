Rails.application.routes.draw do

  resources :user_informations

  resources :user_applications

  resources :volunteer_positions

  devise_for :users

  authenticate :user, lambda { |u| u.is_admin? } do
    mount Upmin::Engine => '/admin'
  end

  root 'pages#home'
  get '/about' => 'pages#about'
  get '/permissions' => 'pages#permissions'
  get '/codeofconduct' => 'pages#code_of_conduct'
  get '/user_information/fake' => 'pages#fake_user_info'
  get '/privacypolicy' => 'pages#privacy'
  get '/users/two_factor_authentication' => 'users#two_factor_authentication'
  get '/users/turn_off_two_factor_authentication' => 'users#disable_otp'
  get '/users/turn_on_two_factor_authentication' => 'users#enable_otp'

end
