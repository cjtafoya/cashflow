Rails.application.routes.draw do

  root 'home#index'
  patch '/users/accounts', to: 'plaidapi#update_accounts'
  post '/users/piechart', to: 'users#piechart'
  resources :users, except: [:new, :create] do
    resources :transactions, only: [:index, :show, :edit, :update]
  end

  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create', as: 'create'

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  post '/users/accounts', to: 'plaidapi#add_account'

  get 'graph/index'
  get 'graph/data', :defaults => { :format => 'json' }
  post 'graph/data', to: 'graph#data'

  get '/users/data', :defaults => { :format => 'json' }

end
