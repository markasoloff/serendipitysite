Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # resources :categories
  devise_for :admins, path: 'admin', skip: :registrations
  devise_for :users
  # devise_for :adminposts
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"

  # namespace :admin do
    # resources :adminposts
    resources :categories
    resources :courses
  # end

  # get 'admin' => 'admin/posts#index'


  root 'courses#index'
  # root 'home#index'
  
  # get "/" => "course#index"
  get "/about" => "courses#about"
  get "/classes" => "courses#classes"
  # get "/classes/:id" => "courses#show", as: "course"
  
  # get "classes/new" => "courses#new", as: "new_course"
  post "course" => "courses#create"
  # get "/list" => "courses#list"

  get "/contact" => "courses#contact"

  get "/adminposts" => "adminposts#index"
  get "/adminposts/:id" => "adminposts#show"
  get "/adminposts/new" => "adminposts#new"

  post "/adminpost/new" => "adminposts#create"

  # get '/contact', to: 'messages#new', as: 'new_message'
  # post '/contact', to: 'messages#create', as: 'create_message'


  # get "/courses" => "course#courses"
  # post "/contact" => "course#contact"
  # patch 'course/:id' => 'course#update'
  # delete 'course/:id' => 'course#destroy'

end
