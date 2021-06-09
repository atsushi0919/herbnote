Rails.application.routes.draw do
  get "/home", to: "static_pages#home"
  get "/about", to: "static_pages#about"
  get "/signup", to: "users#new"
  root "static_pages#home"
  #root "herbs#index"
  resources :users
  resources :herbs
end
