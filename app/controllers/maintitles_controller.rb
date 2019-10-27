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

  private
  def maintitle_params
    params.require(:maintitle).permit(
      :genre,
      :maintitle
    ).merge(user_id: current_user.id)
  end
end
