Rails.application.routes.draw do
  get 'dvr_system/index'

  root to: 'home#index'
  devise_for :users
end
