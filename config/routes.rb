Rails.application.routes.draw do
  get '/users/new'
  # get '/signup'
  # get 'users/create'
  post '/users' => 'users#create' #, as: 'create_user'
  get '/users/:id', to: 'users#show'
  
  resources :houses #,only: || except: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
