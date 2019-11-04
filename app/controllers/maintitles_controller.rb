class MaintitlesController < ApplicationController
  before_action :set_maintitle, only: [:edit,
                                       :update,
                                       :destroy]

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

  private

  def maintitle_params
    params.require(:maintitle).permit(
      :maintitle,
      :genre,
      :explanation).merge(user_id: current_user.id)
  end

  def set_maintitle
    @maintitle = Maintitle.find(params[:id])
  end
end
