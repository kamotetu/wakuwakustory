class MaintitlesController < ApplicationController
  before_action :set_maintitle, only: [:edit,
                                       :update,
                                       :destroy
                                       ]

  def new
    @maintitle = Maintitle.new
  end

  def create
    @maintitle = Maintitle.new(maintitle_params)
    if @maintitle.save
      redirect_to new_maintitle_story_path(@maintitle[:id])
    else
      render 'maintitles/new'
    end
  end

  def edit
    #set_maintitle
  end

  def update
    #set_maintitle
    if @maintitle.user_id == current_user.id
      @maintitle.update(maintitle_params)
      redirect_to maintitle_post_list_path(@maintitle)
    else
      render 'maintitles/edit'
    end
  end

  def destroy
    #set_maintitle
    if @maintitle.user_id == current_user.id  
      @maintitle.destroy
    else
      render 'maintitles/edit'
    end
  end

  def fav
    maintitle = Maintitle.find(params[:id])
    if maintitle.favorited_by?(current_user)
      fav = current_user.favorites.find_by(maintitle_id: maintitle.id)
      fav.destroy
      @all_favorite = maintitle.all_favorite
      @sum = @all_favorite - 1
      maintitle.update(all_favorite: @sum)
      render json: maintitle.id
    else
      fav = current_user.favorites.new(maintitle_id: maintitle.id)
      fav.save
      @all_favorite = maintitle.all_favorite
      @sum = @all_favorite + 1
      maintitle.update(all_favorite: @sum)
      render json: maintitle.id
    end
  end



  private

  def maintitle_params
    params.require(:maintitle).permit(
      :maintitle,
      :genre,
      :explanation,
      :tag_list,
      :cover,
      :remove_cover).merge(user_id: current_user.id, all_review: 0, all_favorite: 0, all_comment: 0, all_story: 0)
  end

  def set_maintitle
    @maintitle = Maintitle.find(params[:id])
  end
end
