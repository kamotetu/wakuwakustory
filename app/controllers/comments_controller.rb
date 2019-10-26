class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment: comment_params[:comment], story_id: comment_params[:story_id], user_id: current_user.id)
    respond_to do |format|
      format.html { redirect_to story_path(params[:story_id])  }
      format.json
    end
    # if @comment.save
    #   # redirect_to root_path
    #   redirect_to story_path(params[:story_id])
    # else
    #   render 'stories/show'
    # end
  end

  private

  def comment_params
    params.permit(:comment, :story_id)
    # ).merge(story_id: [:story_id], user_id: current_user.id)
  end
end
