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
    
    if @memo.save
      flash[:notice] = "게시물이 성공적으로 작성되었습니다"
      redirect_to @memo
    else
      flash[:alert] = "게시물을 작성할 수 없습니다."
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @memo.comments
  end

  def edit
    
  end

  def update
    if @memo.update(memo_params)
    flash[:notice] = "게시물이 성공적으로 수정되었습니다"
    redirect_to @memo
    else
      flash[:alert] = "게시물이 성공적으로 수정될 수 없습니다"
      render :edit
    end
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
