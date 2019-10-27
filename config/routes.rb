Rails.application.routes.draw do
  devise_for :users

  root "stories#index"
  resources :maintitles do
  resources :stories do
  end
    member do
      get 'showblog'
    end
    resources :comments, only: [:create]
  end
  resources :users do
    member do
      get 'mypagemain'
    end
  end
  
end
