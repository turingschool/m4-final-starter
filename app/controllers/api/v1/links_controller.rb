class Api::V1::LinksController < ApplicationController

  def index
    @links = Link.all
    render json: @links
  end

  def create
    user = current_user
    @link = user.links.new(link_params)
    if @link.save
      render json: @link, status: 201
    else
      render json: @link.errors.full_messages, status: 500
    end
  end

  def update
    @link = Link.find(params[:id])
    if @link.update(read: params[:read])
      render json: @link, status: 200
    else
      render json: @link.errors.full_messages, status: 500
    end
  end

  private

  def link_params
    params.permit(:title, :url, :read, :id)
  end
end
