Rails.application.routes.draw do
  devise_for :users

  root "stories#index"
  resources :stories
  resources :users do
    member do
      get 'my_page_main'
      
    end
  
end
