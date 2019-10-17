class StoriesController < ApplicationController

  def index
    @users = User.all
    @stories = Story.all
  end

  def new
    @stories = Story.new
  end

  def create
    @story = current_user.stories.create(story_params)
    if @story.save
      redirect_to root_path

      # flash[:success] = "記事を作成しました"
      # redirect_to articles_url
    else
      render 'stories/new'
    end
  end

  def story_params
    params.require(:story).permit(
      :title, 
      :story, 
      :tag_list) 
  end

end
