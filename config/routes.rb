Rails.application.routes.draw do

  resources :user_informations

  resources :user_applications

  resources :volunteer_positions

  devise_for :users, controllers: {sessions: 'sessions'}

  authenticate :user, lambda { |u| u.is_admin? } do
    mount Upmin::Engine => '/admin'
  end

  root 'pages#home'
  get '/about' => 'pages#about'
  get '/permissions' => 'pages#permissions'
  get '/codeofconduct' => 'pages#code_of_conduct'
  get '/user_information/fake' => 'pages#fake_user_info'
  get '/privacypolicy' => 'pages#privacy'

  # Two factor authentication routes
  get '/users/two_factor_authentication' => 'users#two_factor_authentication'
  get '/users/setup_otp' => 'users#setup_2fa'
  post '/users/enable_otp' => 'users#enable_2fa'
  get '/users/disable_otp' => 'users#disable_2fa'

  # Reports routes
  get '/reports' => 'reports#index'
  get "/reports/export_user_applications" => 'reports#export_user_applications'
  get '/reports/position_popularity' => 'reports#radar_chart_position_picks'
  get '/reports/user_distribution' => 'reports#user_completion'
  get '/reports/t_shirt_distribution' => 'reports#t_shirt_distribution'


end
