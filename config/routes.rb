Rails.application.routes.draw do
  root "herbs#index"  # 仮top
  resources :herbs
end
