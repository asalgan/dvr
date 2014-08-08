class ShowsController < ApplicationController

  def index
    @shows = Show.all
  end

  def show
    @show = Show.find(params[:id])
  end

  def update
  	respond_to do |format|
      if @show.update(show_params)
        format.html { redirect_to show_url }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def edit
  	@show = Show.find(params[:id])
  end

  def record
  	show = Show.find(params[:show_id])
  	show.update_attributes(:recording => true)
  	redirect_to show_path(params[:show_id])
  end

  private

  def show_params
      params.require(:show).permit(:box_id, :recording)
  end


end
