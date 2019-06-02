Rails.application.routes.draw do
  devise_for :users
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"

  root 'home#index'
  
  # get "/" => "course#index"
  get "/about" => "course#about"
  get "/contact" => "course#contact"
  # get '/contact', to: 'messages#new', as: 'new_message'
  # post '/contact', to: 'messages#create', as: 'create_message'


  get "/courses" => "course#courses"
  post "/contact" => "course#contact"
  post 'course' => 'course#create'
  patch 'course/:id' => 'course#update'
  delete 'course/:id' => 'course#destroy'
end
