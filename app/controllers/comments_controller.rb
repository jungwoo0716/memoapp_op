class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:destroy]
   
  
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
    flash[:notice] = "댓글 작성이 완료되었습니다"
    redirect_to :back
    else
    flash[:alert] = "댓글 작성에 실패했습니다"
    redirect_to :back
    end
  end

  def destroy
    @comment.destroy
    
    redirect_to :back
  end
  
  private
  def set_comment
    @comment = Comment.find(params[:id])
  end
  
  def comment_params
    params.require(:comment).permit(:content, :user_id, :memo_id)
  end
end
