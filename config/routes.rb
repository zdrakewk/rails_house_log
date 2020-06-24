Rails.application.routes.draw do
  root 'sessions#login'
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#logout'

  get '/users/new'
  # get '/signup'
  # get 'users/create'
  post '/users' => 'users#create' #, as: 'create_user'
  get '/users/:id', to: 'users#show'

  resources :houses #,only: || except: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

# house_url #=> http://localhost:3000/houses
# house_path #=> /houses

# houses_controller


# HTTP VERBs:
