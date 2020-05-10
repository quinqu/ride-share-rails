Rails.application.routes.draw do
  get 'home/index'

  root to: 'home#index'
  
  resources :drivers

  resources :passengers do 
    resources :trips, only: [:index, :new, :show, :create]
  end 

  resources :trips, only: [:index, :show, :create, :edit, :update]
end
