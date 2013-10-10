class CommentsController < ApplicationController
  respond_to :json

  def create
    comment = Comment.create(comment_params)
    respond_with comment, status: :ok   
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:text, :commentersName, :note_id )
  end

end
