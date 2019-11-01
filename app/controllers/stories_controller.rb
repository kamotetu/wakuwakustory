class StoriesController < ApplicationController
  
  before_action :set_maintitle, only: [:new,
                                       :create,
                                       :show,
                                       :edit]

  def index
    @stories = Story.includes([:user, :maintitle, tags: :taggings]).order("created_at DESC").page(params[:page]).per(5)
    # @story = Story.order("created_at DESC").page(params[:page]).per(5)
    
  end

  def new
    #set_maintitle
    @story = Story.new
  end

  def create
    #set_maintitle
    @story = @maintitle.stories.new(story_params)
    if @story.save
      redirect_to maintitle_post_list_path(@maintitle)

      # flash[:success] = "記事を作成しました"
      # redirect_to articles_url
    else
      render 'stories/new'
    end
  end

  def show
    #set_maintitle
    @comment = Comment.new
    @story = Story.find(params[:id])
    @comments = @story.comments.includes(:user).order("created_at DESC").page(params[:page]).per(5)
    @user = User.find(@story.user_id)
  end

  def destroy
    @story = Story.find(params[:id])
    if @story.user_id == current_user.id
      @story.destroy
    end
  end

  def edit
    #set_maintitle
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


  private
  
  def story_params
    params.require(:story).permit(
      :title, 
      :story, 
      :tag_list).merge(user_id: current_user.id)
  end

  def set_maintitle
    @maintitle = Maintitle.find(params[:maintitle_id])
  end

end
