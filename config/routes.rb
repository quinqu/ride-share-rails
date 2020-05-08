Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :drivers, only: [:index, :show, :new, :create, :edit, :update]

  resources :passengers, only: [:index, :show, :new, :create, :edit, :update]

  resources :trips, only: [:index, :show, :new, :create, :edit, :update]

 
end
