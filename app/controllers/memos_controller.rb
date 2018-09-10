class MemosController < ApplicationController
  def index
    @memos = Memo.all
  end

  def new
  end

  def create
    @memo = Memo.new
    @memo.title = params[:memo][:title]
    @memo.content = params[:memo][:content]
    @memo.user_id = params[:memo][:user_id]
    @memo.save
    
    # redirect_to memo_path(@memo)
    redirect_to @memo
  end

  def show
    @memo = Memo.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
