Rails.application.routes.draw do
  devise_for :users, controllers: {   registrations: 'users/registrations',
                                      sessions: 'users/sessions',
                                      omniauth_callbacks: 'users/omniauth_callbacks' }
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  root "stories#index"
  get 'userindex' => 'searches#userindex'
  get 'maintitleindex' => 'searches#maintitleindex'
  get 'genreindex' => 'searches#genreindex'
  get 'order_popularity' => 'searches#order_popularity'
  get 'order_unpopular' => 'searches#order_unpopular'
  get 'order_favorite' => 'searches#order_favorite'
  get 'order_unfavorite' => 'searches#order_unfavorite'
  get 'order_post' => 'searches#order_post'
  get 'order_unpost' => 'searches#order_unpost'
  get 'order_comment' => 'searches#order_comment'
  get 'order_uncomment' => 'searches#order_uncomment'
  get 'maintitles/fav/:id' => 'maintitles#fav', as: "fav_maintitles"
  get 'q_and_a' => 'informations#q_and_a'
  resources :maintitles do
    get 'post_list' => 'users#post_list'
    post 'like' => 'favorites#create'
    delete 'unlike' => 'favorites#destroy'
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
