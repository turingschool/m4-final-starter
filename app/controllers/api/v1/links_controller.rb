class Api::V1::LinksController < ApplicationController

  def update
    @link = Link.find(params[:id])
    # byebug
    if @link.update_attributes(link_params)
      render json: @link
    else
      render json: @link.errors.full_messages, status: 500
    end
  end

  def create
    link = current_user.links.new(link_params)
    if link.save
      render json: link
    else
      render json: { errors: link.errors.full_messages }
    end
  end

  private


  def link_params
    params.permit(:url, :title, :read)
  end
end
