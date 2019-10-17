class StoriesController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @stories = Story.new
  end

  def create
  end

  def task_params
    params.require(:story).permit(
      :title, 
      :story, 
      :tag_list) 
  end

end
