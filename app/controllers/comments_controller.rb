class CommentsController < ApplicationController
  
  layout 'application'
  before_action :authenticate_user!

  def category
    @comments = Comment.where(category_id: params[:category]).order('created_at DESC')
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:notice] = "Successfully saved comment."
      redirect_to comment_category_path(params[:comment][:category_id])
    else
      flash[:alert] = "There was an error"
      redirect_to comment_category_path(params[:comment][:category_id])
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to :back
  end

private

  def comment_params
    params.require(:comment).permit(:category_id, :comment)
  end

  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
end