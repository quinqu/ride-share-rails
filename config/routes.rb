Rails.application.routes.draw do
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  
  resources :drivers, only: [:index, :show, :new, :create, :edit, :update]

  resources :passengers, only: [:index, :show, :new, :create, :edit, :update] do 
    resources :trips, only: [:index, :new]
  end 

  resources :trips, only: [:index, :show, :new, :create, :edit, :update]

 
end
