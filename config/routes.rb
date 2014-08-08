Rails.application.routes.draw do

  root to: 'home#index'
  
  devise_for :users

  resources :dvr_systems

  resources :shows do
  	get :record
  	post :record
  end

end
