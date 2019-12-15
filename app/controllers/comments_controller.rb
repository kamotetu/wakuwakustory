class CommentsController < ApplicationController

  before_action :set_maintitle
  before_action :set_story

  def create
    # set_maintitle
    # set_story
    @comment = @story.comments.create(comment_params)
    @all_comment = @maintitle.all_comment
    @sum = @all_comment + 1
    @maintitle.update(all_comment: @sum)
    respond_to do |format|
      format.html { redirect_to maintitle_story_path(params[:maintitle_id], params[:story_id])  }
      format.json
    end
  end

  def destroy
    # set_comment
    # set_maintitle
    @comment = Comment.find(params[:id])
    if @comment.user == current_user
      @comment.destroy
      @all_comment = @maintitle.all_comment
      @sum = @all_comment - 1
      @maintitle.update(all_comment: @sum)
    else
      render 'stories/show'
    end

  end

  private

  def comment_params
    params.permit(:comment, :story_id).merge(user_id: current_user.id)
  end

  def set_maintitle
    @maintitle = Maintitle.find(params[:maintitle_id])
  end

  def set_story
    @story = Story.find(params[:story_id])
  end
end
