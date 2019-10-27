class UsersController < ApplicationController

  def mypagemainsub
    @stories = Story.where(maintitle_id: params[:maintitle_id]).page(params[:page]).per(5)
    @maintitle = Maintitle.find(params[:maintitle_id])
    # @maintitles = Maintitle.where(user_id: current_user.id).page(params[:page]).per(5)
    # @user = User.find(params[:id])
  end

  def mypagemain
    @maintitles = Maintitle.where(user_id: current_user.id).order("created_at DESC").page(params[:page]).per(5)
    @user = User.find(params[:id])
  end

  def establishment
    @maintitles = Maintitle.where(user_id: current_user.id).order("created_at DESC").page(params[:page]).per(5)
    @user = User.find(params[:id])
  end
end
