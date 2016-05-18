Rails.application.routes.draw do

  root 'home#index'
  resources :users, except: [:new, :create]

  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create', as: 'create'

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'

  post '/accounts', to: 'plaidapi#add_account'

end
