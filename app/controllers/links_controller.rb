class LinksController < ApplicationController

  def index
    if current_user
      @links = current_user.links
    else
      redirect_to guests_path
    end
  end

  def create
    link = current_user.links.new(link_params)
    if link.save
      redirect_to links_path
    else
      link_error_checker
      redirect_to links_path
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    link = Link.find(params[:id])
    if link.update_attributes(link_params)
      flash['warning'] = 'Link successfully edited'
      redirect_to links_path
    else
      link_error_checker
      redirect_to edit_link_path(link)
    end
  end

  private

  def link_params
    params.require(:link).permit(:url,
                                 :title)
  end

  def link_error_checker
    if link_params[:title] == ''
      flash['warning'] = 'A link must have a title'
    else
      flash['warning'] = 'A link must have a valid URL'
    end
  end

end
