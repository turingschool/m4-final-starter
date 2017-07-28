class Api::V1::LinksController < Api::V1::BaseController

  def index
    @links = current_user.links
    respond_with @links
  end

  def create
    link = Link.new(link_params)
    if link.save
      respond_with :api, :v1, link
    else
      flash[:notice] = "Not a valid link. Don't forget http:// or https://"
    end
  end

  def destroy
    respond_with Link.destroy(params[:id])
  end

  def update
    link = Link.find(params[:id])
    link.update_attributes(link_params_read)
    respond_with link, json: link
    # require 'pry'; binding.pry
  end

  private

  def link_params_read
    params.permit(:read)
  end

  def link_params
    params.require(:link).permit(:url, :title).merge(user_id: current_user.id)
  end
end
