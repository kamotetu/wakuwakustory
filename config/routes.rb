Rails.application.routes.draw do
  devise_for :users, controllers: {   registrations: 'users/registrations',
                                      sessions: 'users/sessions' }

  root "stories#index"

  get 'titleindex' => 'searches#titleindex'
  get 'maintitleindex' => 'searches#maintitleindex'
  get 'genreindex' => 'searches#genreindex'

  resources :maintitles do
    get 'post_list' => 'users#post_list'
    resources :stories do
      resources :comments, only: [:create]
    end
  end
  resources :users do
    member do
      get 'mypagemain'
      get 'establishment'
      get 'user_post_list'
      get 'profile'
    end
  end
  
end
