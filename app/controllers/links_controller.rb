class LinksController < ApplicationController
  def index
    if current_user
      @links = current_user.links
    else
      redirect_to login_path
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

    def update
      link = Link.find(params[:id])
        if link.update(link_params)
          flash[:success] = "Link Updated Sucessfully"
          redirect_to links_path
        else
          flash[:warning] = link.errors.full_messages.join(', ')
          redirect_to edit_link_path(link)
        end
    end

    private

    def link_params
      params.require(:link).permit(:title, :url).merge(user_id: current_user.id)
    end

end
