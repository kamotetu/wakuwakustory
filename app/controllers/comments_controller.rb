class CommentsController < ApplicationController

  def create
    @maintitle = Maintitle.find(params[:maintitle_id])
    @story = Story.find(params[:story_id])
    @comment = @story.comments.create(comment_params)
    
    respond_to do |format|
      format.html { redirect_to maintitle_story_path(params[:maintitle_id], params[:story_id])  }
      format.json
    end
    
    
  end

  private

  def comment_params
    params.permit(:comment, :story_id).merge(user_id: current_user.id)
    # ).merge(story_id: [:story_id], user_id: current_user.id)
  end
end
