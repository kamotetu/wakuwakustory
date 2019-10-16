Rails.application.routes.draw do
  devise_for :users

  root "storys#index"
  resources :storys
  
end
