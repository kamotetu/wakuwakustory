Rails.application.routes.draw do
  devise_for :users, controllers: {   registrations: 'users/registrations',
                                      sessions: 'users/sessions' }

  root "stories#index"
  resources :maintitles do
    get 'post_list' => 'users#post_list'
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
      get 'user_post_list'
      get 'user_establishment'
      get 'profile'
      get 'user_profile'
    end
  end
  
end
