class RepliesController < ApplicationController
  def create
    @dessert = Dessert.find(params[:dessert_id])
    @comment = @dessert.comments.find(params[:comment_id])
    @reply = @comment.replies.build(reply_params)
    @reply.dessert_id = @dessert.id
    if @reply.save!
      redirect_to dessert_path(@dessert)
    end
  end

  private

  def reply_params
    params.require(:reply).permit(:content)
  end
end
