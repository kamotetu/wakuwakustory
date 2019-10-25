class StoriesController < ApplicationController

  def index
    @users = User.order("created_at DESC").page(params[:page]).per(5)
    @stories = Story.order("created_at DESC").page(params[:page]).per(5)
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

  def show
    @story = Story.find(params[:id])
    @comments = @story.comments.includes(:user).order("created_at DESC").page(params[:page]).per(5)

  end

  private
  
  def story_params
    params.require(:story).permit(
      :title, 
      :story, 
      :tag_list) 
  end

end
