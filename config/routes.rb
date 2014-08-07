Rails.application.routes.draw do

  root to: 'home#index'
  devise_for :users

  resources :dvr_systems
  resources :shows

end
