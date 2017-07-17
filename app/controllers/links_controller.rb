class LinksController < ApplicationController
  def index
    unless current_user
      redirect_to login_path
    end
    @links = Link.all
  end

  def create
    @link = Link.new(link_params)

    respond_to do |format|
      if @link.save
        format.html { redirect_to root_path, notice: 'Link was successfully created.' }
        format.json { render json: @link, status: :created }
      else
        format.html { render :new }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
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
          redirect_to edit_link_path(link)
        end
    end

    private

    def link_params
      params.require(:link).permit(:title, :url).merge(user_id: current_user.id)
    end

end
