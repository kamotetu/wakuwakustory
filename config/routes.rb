Rails.application.routes.draw do
  devise_for :users

  root "stories#index"
  resources :maintitles do
    get 'mypagemainsub' => 'users#mypagemainsub'
    resources :stories do
      member do
        get 'showblog'
      end
      resources :comments, only: [:create]
    end
  end
  resources :users do
    member do
    #   get 'mypagemainsub'
      get 'mypagemain'
      get 'establishment'
    end
  end
  
end
