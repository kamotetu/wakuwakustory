class MaintitlesController < ApplicationController

  def new
    @maintitles = Maintitle.new
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
    @maintitle = Maintitle.find(params[:id])
  end

  def update
    @maintitle = Maintitle.find(params[:id])
    if @maintitle.user_id == current_user.id
      @maintitle.update(maintitle_params)
      redirect_to mypagemain_user_path(current_user)
    else
      render 'maintitles/edit'
    end
  end

  def destroy
    @maintitle = Maintitle.find(params[:id])
    if @maintitle.user_id == current_user.id  
      @maintitle.destroy
    else
      
    end
  end

  private
  def maintitle_params
    params.require(:maintitle).permit(
      :genre,
      :maintitle,
      :explanation
    ).merge(user_id: current_user.id)
  end
end
