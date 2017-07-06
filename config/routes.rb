Rails.application.routes.draw do
  devise_for :users
  resources :albums

  resources :users, only: [] do
  	get :dashboard
  end
  
  root 'home#site_index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
