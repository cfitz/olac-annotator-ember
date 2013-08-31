class CommentsController < ApplicationController
  respond_to :json

  def create
    respond_with Comment.create(comment_params)
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:text, :commentersName, :note_id )
  end

end