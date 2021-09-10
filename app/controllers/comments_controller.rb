class CommentsController < ApplicationController
 before_action :set_post, only: [:show, :update, :destroy]
  def index
    comments = Comment.order(created_at: :desc)
    render json: { status: 'SUCCESS', message: 'Loaded posts', data: comments }
  end
  def map_comment
    @comments_map_id = Comment.where(maps_id: params[:map_id])
    render json: { status: 'SUCCESS', message: 'Loaded the post', data: @comments_map_id }
  end
  
  def show
    render json: { status: 'SUCCESS', message: 'Loaded the post', data: @comment }
  end
  
  def create
    comment = Comment.new(post_params)
    if comment.save
      render json: { status: 'SUCCESS', data: comment }
    else
      render json: { status: 'ERROR', data: comment.errors }
    end
  end
  
  def destroy
    @comment.destroy
    render json: { status: 'SUCCESS', message: 'Deleted the post', data: @comment }
  end

  
  private
  def set_post
    @comment = Comment.find(params[:id])
  end
  def post_params
    params.permit(:body, :maps_id, :rank)
  end
end
