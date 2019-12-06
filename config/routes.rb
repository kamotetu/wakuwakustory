Rails.application.routes.draw do
  devise_for :users, controllers: {   registrations: 'users/registrations',
                                      sessions: 'users/sessions' }
  # mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  root "stories#index"
  get 'userindex' => 'searches#userindex'
  get 'maintitleindex' => 'searches#maintitleindex'
  get 'genreindex' => 'searches#genreindex'
  get 'maintitles/fav/:id' => 'maintitles#fav', as: "fav_maintitles"
  resources :maintitles do
    get 'post_list' => 'users#post_list'
    post 'like' => 'favorites#create'
    delete 'unlike' => 'favorites#destroy'
    member do
      # post 'like_review'
      # post 'like_review_more'
      # delete 'unlike_review'
    end
    resources :stories do
      post 'like_review'
      post 'like_review_more'
      delete 'unlike_review'
      resources :comments, only: [:create,
                                  :destroy]
    end
  end
  resources :users do
    member do
      get 'mypagemain'
      get 'establishment'
      get 'user_post_list'
      get 'profile'
      get 'favorite_list'
    end
  end
  
end
