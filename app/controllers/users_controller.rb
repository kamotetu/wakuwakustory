class UsersController < ApplicationController
  before_action :set_user, only: [:user_post_list,
                                  :mypagemain,
                                  :establishment,
                                  :profile,
                                  :favorite_list]
  before_action :set_user_all_review, only: [:mypagemain,
                                             :profile]

  def post_list #投稿一覧
    @stories = Story.where(maintitle_id: params[:maintitle_id]).order("created_at DESC").page(params[:page]).per(5)
    @maintitle = Maintitle.find(params[:maintitle_id])
    @user_id = @maintitle.user_id
    @user = User.find(@user_id)
    gon.maintitle_id = @maintitle.id
    gon.all_favorite = @maintitle.all_favorite
    # @maintitle_reviews = Review.where(maintitle_id: params[:maintitle_id])
    # @a = []
    # @maintitle_reviews.each do |maintitle_review|
    #   p = maintitle_review.review
    #   @a.push(p)
    # end
    # @maintitle_all_review = @a.sum

    # @maintitles = Maintitle.where(user_id: current_user.id).page(params[:page]).per(5)
  end

  def user_post_list #未ログイン投稿一覧画
    #set_user
    
    @stories = Story.where(user_id: params[:id]).order("created_at DESC").page(params[:page]).per(10)
    @maintitles = Maintitle.where(user_id: params[:id])
    @reviews = Review.where(story_id: @stories.ids)
    if @reviews.present?
      @a = []
      @reviews.each do |review|
        p = review.review
        @a.push(p)
      end
      @user_all_review = @a.sum
    end
  end
  
  def mypagemain #マイページ
    # set_user
    # set_user_all_review
    @maintitles = Maintitle.where(user_id: current_user.id).order("created_at DESC").page(params[:page]).per(5)
    @stories = Story.where(user_id: current_user.id).order("created_at DESC").page(params[:page]).per(5)
    # @reviews = Review.where(story_id: @stories.ids)
    # if @reviews.present?
    #   @a = []
    #   @reviews.each do |review|
    #     p = review.review
    #     @a.push(p)
    #   end
    #   @user_all_review = @a.sum
    # end
  end

  def establishment #開設一覧
    #set_user
    @maintitles = Maintitle.where(user_id: params[:id]).order("created_at DESC").page(params[:page]).per(10)
    @stories = Story.where(user_id: params[:id]).order("created_at DESC").page(params[:page]).per(3)
  end

  def profile #未ログイン時、他のユーザープロフィール画面
    #set_user
    @maintitles = Maintitle.where(user_id: params[:id]).order("created_at DESC").page(params[:page]).per(5)
    @stories = Story.where(user_id: params[:id]).order("created_at DESC").page(params[:page]).per(5)
    # @stories_review = Story.where(user_id: params[:id])
    # @stories_review = Review.where(story_id: @stories_review.ids)
    # if @stories_review.present?
    #   @a = []
    #   @stories_review.each do |review|
    #     p = review.review
    #     @a.push(p)
    #   end
    #   @user_all_review = @a.sum
    # end
  end

  def favorite_list
    @favorites = Favorite.where(user_id: @user.id)
    @a = []
    @favorites.each do |favorite|
      p = favorite.maintitle_id
      @a.push(p)
    end
    @maintitles = Maintitle.where(id: @a).order("created_at DESC").page(params[:page]).per(10)
    
  end
  


  private

  def set_user
    @user = User.find(params[:id])
  end
  
  def set_user_all_review
    @stories_review = Story.where(user_id: params[:id])
    @stories_review = Review.where(story_id: @stories_review.ids)
    if @stories_review.present?
      @a = []
      @stories_review.each do |review|
        p = review.review
        @a.push(p)
      end
      @user_all_review = @a.sum
    end
  end
end
