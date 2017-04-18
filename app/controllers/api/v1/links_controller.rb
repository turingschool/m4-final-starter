class Api::V1::LinksController < ApplicationController
  def index
    @links = Link.where(user_id: current_user.id).reverse
  end

  # def create
  #   @link = current_user.links.create(link_params)
  #   require 'pry'; binding.pry
  #   if @link.valid?
  #     render json: @link
  #   else
  #     render errors:  @link.errors
  #   end
  # end
  def create
    @link = current_user.links.create(link_params)
    if @link.valid?
      render json: @link
    else
      @errors = @link.errors
      format.json { render json: @errors, status: :unprocessable_entity }
    end

  end

  def update
    @link = Link.find(params[:id])
    if @link.update_attributes(link_params)
      render json: @link
    else
      render json: @link.errors.full_messages, status: 500
    end
  end

  private

  def link_params
    params.permit(:title, :url, :read)
  end
end
