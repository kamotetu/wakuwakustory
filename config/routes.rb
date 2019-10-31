Rails.application.routes.draw do
  devise_for :users, controllers: {   registrations: 'users/registrations',
                                      sessions: 'users/sessions' }

  root "stories#index"

  get 'titleindex' => 'searches#titleindex'
  get 'maintitleindex' => 'searches#maintitleindex'

  get 'novel' => 'genres#novel'
  get 'blog' => 'genres#blog'
  get 'share' => 'genres#share'
  get 'essay' => 'genres#essay'
  get 'columu' => 'genres#columu'
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
      get 'profile'
    end
  end
  
end
