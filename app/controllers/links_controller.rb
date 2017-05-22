class LinksController < ApplicationController
  def index
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
  end
end
