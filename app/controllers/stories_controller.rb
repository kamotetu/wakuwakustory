class StoriesController < ApplicationController
  
  before_action :set_maintitle, only: [:new,
                                       :create,
                                       :show,
                                       :edit,
                                       :update,
                                       :like_review,
                                       :like_review_more,
                                       :unlike_review]
  before_action :set_story, only: [:show,
                                   :destroy,
                                   :edit,
                                   :update]

  def index
    @maintitles = Maintitle.all.order("created_at DESC").page(params[:page]).per(16)
    
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
    if user_signed_in?
      @review = Review.find_by(story_id: @story.id, user_id: current_user.id)
      if @review != nil
        gon.my_review_count = @review.review + 1
      else
        @review = Review.create(user_id: current_user.id, story_id: @story.id, maintitle_id: @maintitle.id, review: 0)
        gon.my_review_count = @review.review + 1
      end
    end
    @reviews = Review.where(story_id: @story.id)
    @a = []
    @reviews.each do |review|
      p = review.review
      @a.push(p)
    end
    @review_all_count = @a.sum
    gon.review_all_count = @a.sum + 1

    
    # @story_next_id = @maintitle.stories.ids
    # @story_next = @story_next_id.order("id DESC").first
    # @story_next = @story_next_id.where(id < @story.id).order("id DESC").first
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

  def like_review
    # set_maintitle
    @story = Story.find(params[:story_id])
    # Review.create(maintitle_id: @maintitle.id, user_id: current_user.id, review: 1, story_id: @story.id)
    # render json: 1
    @review = Review.find_by(story_id: @story.id, user_id: current_user.id)
    p = @review.review + 1
    @review.update(review: p)
    
  end

  # def like_review_more
  #   # set_maintitle
  #   @story = Story.find(params[:story_id])
  #   @review = Review.find_by(story_id: @story.id, user_id: current_user.id)
  #   p = @review.review + 1
  #   @review.update(review: p)
  #   # render json: @review.review
  #   # gon.my_review_count = @review.review

  # end

  def unlike_review
    # set_maintitle
    # set_story

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
