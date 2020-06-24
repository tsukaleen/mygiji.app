Rails.application.routes.draw do
  devise_for :users
  root 'giji#index'
  resources :giji do
    resources :comments, only: [:create]
    get :search, on: :collection
  end
  resources :users, only: [:show]
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
