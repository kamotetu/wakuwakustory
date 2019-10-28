class StoriesController < ApplicationController

  def index
    @stories = Story.order("created_at DESC").page(params[:page]).per(5)
    @story = Story.order("created_at DESC").page(params[:page]).per(5)
    @story.each do |story|
      @maintitle = story.maintitle
    end
    
  end

  def new
    @story = Story.new
    @maintitle = Maintitle.find(params[:maintitle_id])
  end

  def create
    @maintitle = Maintitle.find(params[:maintitle_id])
    @story = @maintitle.stories.new(story_params)
    if @story.save
      redirect_to root_path

      # flash[:success] = "記事を作成しました"
      # redirect_to articles_url
    else
      render 'stories/new'
    end
  end

  def show
    @comment = Comment.new
    @story = Story.find(params[:id])
    @comments = @story.comments.includes(:user).order("created_at DESC").page(params[:page]).per(5)
    @maintitle = Maintitle.find(params[:maintitle_id])
  end

  def destroy
    @story = Story.find(params[:id])
    if @story.user_id == current_user.id
      @story.destroy
    end
  end

  def edit
    @story = Story.find(params[:id])
    @maintitle = Maintitle.find(params[:maintitle_id])
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
    @stories = Story.where(genre: "ブログ").page(params[:page]).per(5)
  end

  private
  
  def story_params
    params.require(:story).permit(
      :title, 
      :story, 
      :tag_list).merge(user_id: current_user.id)
  end

end
