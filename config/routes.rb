Rails.application.routes.draw do
  resources :pages
  devise_for :users, path: '',path_names: { sign_in: 'login',sign_out:'logout',sign_up:'register' }
  resources :users
  resources :businesses
  resources :tasks
  root to: 'pages#index'
 

  get 'show_businesses', to: 'users#show_businesses', as: 'show_businesses'
  get 'get_businesses', to: 'users#get_businesses', as: 'get_businesses'



  # devise_for :users, controllers: {
  #   sessions: 'users/sessions'
  # }


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
