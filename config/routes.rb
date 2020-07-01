Rails.application.routes.draw do
  resources :rooms
  root 'sessions#login'

  # localhost:3000/sessions/login
  # get 'sessions/login'
  # post 'sessions/create'
  # get 'sessions/logout'

  # localhost:3000/login
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#logout'

  # get '/users/new'
  # get '/signup'
  # get 'users/create'
  # post '/users' => 'users#create' #, as: 'create_user'
  # get '/users/:id', to: 'users#show'

  # get '/users/:id/houses', to: 'houses#index'
  resources :houses #,only: || except: [:index, :show] 
  
  resources :users, only: [:show, :new, :create] do 
    resources :houses, only: [:show, :new, :index] # :create]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

# house_url => http://localhost:3000/houses
# house_path => /houses

# controller#actions
# # houses_controller
# **houses#
# ^ show => '/houses/:id' => GET => house_path(house_obj)
# index => '/houses' => GET => houses_path
# create => '/houses' => POST => houses_path
# new => '/houses/new' => GET => new_house_path
# ^ edit => '/houses/:id/edit' => GET => edit_house_path(house_obj)
# ^ update => '/houses/:id' => PATCH / PUT => house_path(house_obj)
# ^ destory => '/houses/:id' => DELETE => house_path(house_obj)

# HTTP VERBs:
