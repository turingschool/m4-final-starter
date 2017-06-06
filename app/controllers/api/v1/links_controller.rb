class Api::V1::LinksController < ApplicationController

  def update
    @link = Link.find(params[:id])
    if @link.update_attributes(link_params)
      render json: @link
    else
      render json: @link.errors.full_messages, status: 500
    end
  end

  def create
    @link = current_user.links.new(link_params)
    if @link.save
      render json: @link
    else
      render json: @link.errors.full_messages, status: 200
    end
  end

  private

  def link_params
    params.require(:link).permit(:read, :url, :title)
  end
end
