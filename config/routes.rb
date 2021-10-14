Rails.application.routes.draw do
  resources :pages
  devise_for :users, path: '',path_names: { sign_in: 'login',sign_out:'logout',sign_up:'register' }
  resources :users
  resources :businesses
  root to: 'pages#index'

  # devise_for :users, controllers: {
  #   sessions: 'users/sessions'
  # }


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
