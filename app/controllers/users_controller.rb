class UsersController < ApplicationController
  before_action :set_user, only: [:user_post_list,
                                  :mypagemain,
                                  :establishment,
                                  :profile,
                                  :favorite_list]

  def post_list #投稿一覧
    @stories = Story.where(maintitle_id: params[:maintitle_id]).order("created_at DESC").page(params[:page]).per(5)
    @maintitle = Maintitle.find(params[:maintitle_id])
    @user_id = @maintitle.user_id
    @user = User.find(@user_id)
    gon.maintitle_id = @maintitle.id
    # @maintitles = Maintitle.where(user_id: current_user.id).page(params[:page]).per(5)
  end

  def user_post_list #未ログイン投稿一覧画
    #set_user
    @stories = Story.where(user_id: params[:id]).order("created_at DESC").page(params[:page]).per(10)
    @maintitles = Maintitle.where(user_id: params[:id])
  end
  
  def mypagemain #マイページ
    #set_user
    @maintitles = Maintitle.where(user_id: current_user.id).order("created_at DESC").page(params[:page]).per(5)
    @stories = Story.where(user_id: current_user.id).order("created_at DESC").page(params[:page]).per(5)
    
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
  
end
