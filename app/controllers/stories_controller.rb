class StoriesController < ApplicationController
  
  before_action :set_maintitle, only: [:new,
                                       :create,
                                       :show,
                                       :edit,
                                       :update,
                                       :destroy,
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
      @story_count = @maintitle.all_story + 1
      @maintitle.update(new_story: @story.created_at, all_story: @story_count)
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
    @comments = @story.comments.includes(:user).order("created_at DESC")
    gon.maintitle_id = @maintitle.id
    gon.story_id = @story.id
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
    @story_review_count = @reviews.sum(:review)
    
    gon.review_all_count = @story_review_count + 1
    
    @stories = @maintitle.stories.order('created_at desc, id desc')
    gon.story_comment_count = @story.comments.count
    # @story_next = @story_next_id.order("id DESC").first
    # @story_next = @story_next_id.where("id < ?", id).order("id DESC").first
  end

  def destroy
    #set_story
    #set_maintitle

    if @story.user_id == current_user.id
      @story_count = @maintitle.all_story.to_i - 1
      a = @story.reviews.sum(:review)
      b = @story.comments.count(:comment)
      @maintitle_comment_count = @maintitle.all_comment - b
      @maintitle_review_count = @maintitle.all_review - a
      @maintitle.update(all_story: @story_count, all_review: @maintitle_review_count, all_comment: @maintitle_comment_count)
      @story.destroy
      redirect_to maintitle_post_list_path(@maintitle)
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
      # redirect_to 
    end
  end

  def like_review
    # set_maintitle
    @story = Story.find(params[:story_id])
    @review = Review.find_by(story_id: @story.id, user_id: current_user.id)
    p = @review.review + 1
    @review.update(review: p)
    @maintitle_review = @maintitle.reviews
    @sum = @maintitle_review.sum(:review)

    @maintitle.update(all_review: @sum)
    render json: @story.id


  end

  def unlike_review
    # set_maintitle
    @story = Story.find(params[:story_id])
    @review = Review.find_by(user_id: current_user.id, story_id: @story.id)
    @story_review = @review.review
    @maintitle_review = @maintitle.reviews
    @sum = @maintitle_review.sum(:review)
    @sum = @sum - @story_review
    @maintitle.update(all_review: @sum)
    @review.update(review: 0)
    
    render json: @story.id
    


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
