class MapsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]
  def index
    maps = Map.order(created_at: :desc)
    render json: { status: 'SUCCESS', message: 'Loaded posts', data: maps }
  end
  
  def show
    render json: { status: 'SUCCESS', message: 'Loaded the post', data: @map }
  end
  
  def create
    map = Map.new(post_params)
    if map.save
      render json: { status: 'SUCCESS', data: map }
    else
      render json: { status: 'ERROR', data: map.errors }
    end
  end
  
  def destroy
    @map.destroy
    render json: { status: 'SUCCESS', message: 'Deleted the post', data: @map }
  end

  
  private
  def set_post
    @map = Map.find(params[:id])
  end
  def post_params
    params.permit(:latitude,:longitude,:rank)
  end
end