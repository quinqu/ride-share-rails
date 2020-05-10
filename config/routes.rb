Rails.application.routes.draw do
  get 'welcome/index'

  root to: 'welcome#index'
  
  resources :drivers

  resources :passengers do 
    resources :trips, only: [:index, :new, :show, :create]
  end 

  resources :trips, only: [:index, :show, :create, :edit, :update]
end
