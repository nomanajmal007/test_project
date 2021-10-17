Rails.application.routes.draw do
  resources :pages
  devise_for :users, path: '',path_names: { sign_in: 'login',sign_out:'logout',sign_up:'register' }
  resources :users
  resources :businesses
  resources :tasks
  root to: 'pages#index'
  get '/users/my_data', to: 'users#my_data', as: 'users_my_data'



  # devise_for :users, controllers: {
  #   sessions: 'users/sessions'
  # }


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
