Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"

  get "/" => "course#index"
  get "/contact" => "course#contact"
  get "/about" => "course#about"

  get "/courses" => "course#courses"
  post "/contact" => "course#contact"
  post 'course' => 'course#create'
  patch 'course/:id' => 'course#update'
  delete 'course/:id' => 'course#destroy'
end
