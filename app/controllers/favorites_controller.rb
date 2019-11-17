class FavoritesController < ApplicationController

  def create
    @user = current_user
    @maintitle = Maintitle.find(params[:maintitle_id])
    if Favorite.create(user_id: @user.id, maintitle_id: @maintitle.id)
      redirect_to maintitle_post_list_path
    else
      redirect_to root_path
    end

  end

  def destroy
    @user = current_user
    @maintitle = Maintitle.find(params[:maintitle_id])
    if favorite = Favorite.find_by(user_id: @user.id, maintitle_id: @maintitle.id)
      favorite.delete
      redirect_to maintitle_post_list_path
    else
      redirect_to root_path
    end
  end
end
