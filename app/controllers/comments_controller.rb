class CommentsController < ApplicationController
 def create
   @comment = Comment.create(text: comment_params[:text], giji_id: comment_params[:giji_id], user_id: current_user.id)
   redirect_to "/giji/#{@comment.giji_id}"
 end
 
 private 
  def comment_params
  params.permit(:text, :giji_id)
  end
end
