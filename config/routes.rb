Rails.application.routes.draw do
  devise_for :users

  root "storys#index"
  get 'storys/index'
  
end
