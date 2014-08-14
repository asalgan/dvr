Rails.application.routes.draw do

  root to: 'home#index'
  
  devise_for :users

  resources :dvr_systems

  resources :shows do
  	get :record
  	post :record
  	get :delete_record
  	post :delete_record
  end

  # post '/change_recording' =>'shows#change_recording'


end
