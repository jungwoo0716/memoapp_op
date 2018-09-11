class MemosController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_memo, only: [:show, :edit, :update, :destroy]
  before_action :is_writer?, only: [:edit, :update, :destroy]
  
  def index
    @memos = Memo.order(created_at: :DESC)
  end

  def new
    @memo = Memo.new
  end

  def create
    @memo = Memo.new(memo_params)
    @memo.save
    # redirect_to memo_path(@memo)
    redirect_to @memo
  end

  def show
    @comment = Comment.new
    @comments = @memo.comments
  end

  def edit
    
  end

  def update
    @memo.update(memo_params)
    
    # redirect_to memo_path(@memo)
    redirect_to @memo
  end

  def destroy
    @memo.destroy
    redirect_to memos_path
  end
  
  private 
  def set_memo
    @memo = Memo.find(params[:id])
  end
  
  def memo_params
    params.require(:memo).permit(:user_id, :title, :content)
  end
  
  def is_writer? # edit/update/destroy
    redirect_to @memo unless @memo.user == current_user
  end
  
end
