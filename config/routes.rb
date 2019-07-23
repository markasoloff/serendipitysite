Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # resources :posts
  resources :categories
  # devise_for :admins, path: 'admin', skip: :registrations
  # devise_for :users
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"

  namespace :admin do
    resources :admin_posts
    resources :categories
  end

  # get 'admin' => 'admin/posts#index'


  root 'course#index'
  # root 'home#index'
  
  # get "/" => "course#index"
  get "/about" => "course#about"
  get "/contact" => "course#contact"
  # get '/contact', to: 'messages#new', as: 'new_message'
  # post '/contact', to: 'messages#create', as: 'create_message'


  # get "/courses" => "course#courses"
  # post "/contact" => "course#contact"
  # post 'course' => 'course#create'
  # patch 'course/:id' => 'course#update'
  # delete 'course/:id' => 'course#destroy'

end
