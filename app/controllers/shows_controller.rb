class ShowsController < ApplicationController

  def index
    @shows = Show.all
  end

  def show
    @show = Show.find(params[:id])
  end

  def update
    @show = Show.find(params[:id])

    respond_to do |format|
      if @show.update
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
    
    show.box_id = params[:show][:box_id]
    show.save

    current_show_time = show.start_time..show.end_time
    @current_saved_shows_array = []

    Show.where(:recording => true).each do |showtime|
      @current_saved_shows_array << (showtime.start_time..showtime.end_time)
    end

    if @current_saved_shows_array.select {|c| current_show_time.overlaps?(c)}.present?
      redirect_to show_path(params[:show_id])
    else
      show.update_attributes(:recording => true)
      show.save
      redirect_to show_path(params[:show_id])
    end
  end

  private

    def show_params
      params.require(:show).permit(:box_id, :recording)
    end

end
