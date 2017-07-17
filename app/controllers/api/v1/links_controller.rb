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
    link = current_user.Link.new(new_link_params)
    if link.save
      render json: user
    end
  end

  private

  def link_params
    params.permit(:read)
  end

  def new_link_params
    params.require(:link).permit(:URL, :title)
  end
end
