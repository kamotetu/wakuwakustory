Rails.application.routes.draw do
  devise_for :users

  root "stories#index"
  resources :stories do
    resources :comments, only: [:create]
  end
  resources :users do
    member do
      get 'mypagemain'
    end
  end
  
end
