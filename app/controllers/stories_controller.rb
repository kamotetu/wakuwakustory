class StoriesController < ApplicationController

  def index
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

  def destroy
    @story = Story.find(params[:id])
    if @story.user_id == current_user.id
      @story.destroy
    end
  end

  def edit
    @story = Story.find(params[:id])
  end

  def update
    @story = Story.find(params[:id])
    if @story.user_id == current_user.id
      @story.update(story_params)
    else
      redirect_to edit_story_path
    end
  end

  def showblog

  end

  private
  
  def story_params
    params.require(:story).permit(
      :genre,
      :title, 
      :story, 
      :tag_list) 
  end

end
