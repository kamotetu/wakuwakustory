class StoriesController < ApplicationController
  
  before_action :set_maintitle, only: [:new,
                                       :create,
                                       :show,
                                       :edit,
                                       :update]
  before_action :set_story, only: [:show,
                                   :destroy,
                                   :edit,
                                   :update]

  def index
    @stories = Story.includes([:user, :maintitle, tags: :taggings]).order("created_at DESC").page(params[:page]).per(5)
    # @stories = Story.all.order("created_at DESC").page(params[:page]).per(5)
    
  end

  def new
    #set_maintitle
    @story = Story.new
  end

  def create
    #set_maintitle
    @story = @maintitle.stories.new(story_params)
    if @story.save
      redirect_to maintitle_story_path(@maintitle, @story)

      # flash[:success] = "記事を作成しました"
      # redirect_to articles_url
    else
      render 'stories/new'
    end
  end

  def show
    #set_maintitle
    #set_story
    @comment = Comment.new
    @comments = @story.comments.includes(:user).order("created_at DESC").page(params[:page]).per(5)
    @user = User.find(@story.user_id)
  end

  def destroy
    #set_story
    if @story.user_id == current_user.id
      @story.destroy
    end
  end

  def edit
    #set_maintitle
    #set_story
  end

  def update
    #set_story
    if @story.user_id == current_user.id
      @story.update(story_params)
      redirect_to maintitle_story_path(@maintitle, @story)
    else
      render 'stories/edit'
    end
  end


  private
  
  def story_params
    params.require(:story).permit(
      :title, 
      :story, 
      :tag_list,
      :image,
      :remove_image,
      :synopsis,
      :notice).merge(user_id: current_user.id)
  end

  def set_maintitle
    @maintitle = Maintitle.find(params[:maintitle_id])
  end

  def set_story
    @story = Story.find(params[:id])
  end

end
