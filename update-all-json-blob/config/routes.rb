Rails.application.routes.draw do
  get "/health/check", controller: "health", action: "check"
  resources :cats
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "cats#index"
end
