class ShowsController < ApplicationController

  def index
    @shows = Show.all
    @show_dropdowns = Box.all.collect { |p| [ p.box_number, p.id ] }
    @page_class = "show_page"
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
    @show = Show.find(params[:show_id])

    @show.box_id = params[:show][:box_id]

    if @show.box.box_number == 1
      record_show(box_one)

    elsif @show.box.box_number == 2
      record_show(box_two)

    end

  end

  def delete_record
    show = Show.find(params[:show_id])
    show.update_attributes(recording: false)
    show.update_attributes(box_id: nil)
    redirect_to :back
  end

  private

    def show_params
      params.require(:show).permit(:box_id, :recording)
    end

    def box_one
      Box.find_by(:box_number => 1)
    end

    def box_two
      Box.find_by(:box_number => 2)
    end

    def record_show(box)
      shows = box.shows.where(:recording => true)
      current_show_time = @show.start_time..@show.end_time
      @current_saved_shows_array = []
      
      shows.each do |showtime|
        @current_saved_shows_array << (showtime.start_time..showtime.end_time)
      end

      if @current_saved_shows_array.select {|c| current_show_time.overlaps?(c)}.present?
        redirect_to :back
      else
        @show.update_attributes(:recording => true)
        @show.save
        redirect_to :back
      end
    end


end
