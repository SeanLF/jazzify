Rails.application.routes.draw do

  concern :paginatable do
    get '(page/:page)', :action => :index, :on => :collection, :as => ''
  end

  resources :volunteer_position_contacts
  resources :user_informations, :concerns => :paginatable

  resources :user_applications, :concerns => :paginatable do
    collection do
      get 'success', action: :success
      get ':id/view', action: :view, as: :view
      post 'accept_or_deny', action: :accept_or_deny
      post 'reset/:id', action: :reset
    end
  end

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
  get '/faq' => 'pages#faq'

  # Two factor authentication routes
  get '/two_factor_authentication' => 'users#two_factor_authentication'
  get '/two_factor_authentication/configure' => 'users#setup_2fa'
  post '/two_factor_authentication/enable' => 'users#enable_2fa'
  post '/two_factor_authentication/disable' => 'users#disable_2fa'
  get '/two_factor_authentication/disable' => 'users#prepare_disable_2fa'

  # Reports routes
  get '/reports' => 'reports#index'
  get "/reports/export_user_applications"
  post "/reports/export_user_applications"
  get '/reports/position_popularity' => 'reports#position_picks'
  get '/reports/user_distribution' => 'reports#user_completion'
  get '/reports/t_shirt_distribution'
  get '/reports/user_sign_up_distribution'
  get '/reports/user_last_sign_in_at'

end
