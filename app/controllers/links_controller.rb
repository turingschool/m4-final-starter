class LinksController < ApplicationController
  before_filter :check_login

  def index
    @link = Link.new
    @links = current_user.links
  end

  def create

    @link = current_user.links.create(link_params)
    # unless @link.save
    #   flash.now[:failure] =  @link.errors.full_messages
    #   render :index
    #   # status: 500
    #

    if @link.save
      render json: @link
    else
      render json: @link.errors.full_messages.to_s.delete('"'), status: 500
    end
  end

  def edit
    @link  = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])

    if @link.update(link_params)
      flash[:success] = "Link Updated!"
      redirect_to links_path
    else
      flash.now[:failure] =  @link.errors.full_messages.to_s
      render :edit
    end
  end

  def link_params
    params.require(:link).permit(:title, :url)
  end


end
