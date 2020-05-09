Rails.application.routes.draw do
  get 'home/index'

  root to: 'home#index'
  
  resources :drivers, only: [:index, :show, :new, :create, :edit, :update]

  resources :passengers do 
    resources :trips, only: [:index, :new, :show, :create]
  end 

  resources :trips, only: [:index, :show, :create, :edit, :update]
end
