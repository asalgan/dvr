class ShowsController < ApplicationController

  respond_to :html, :js

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
    show = Show.find(params[:show_id])
    show.box_id = params[:show][:box_id]

    if show.box.box_number == 1
      record_show(box_one, show)
    elsif show.box.box_number == 2
      record_show(box_two, show)
    end
    redirect_to :back
  rescue ActionController::RedirectBackError
    redirect_to shows_path
  end

  def delete_record
    show = Show.find(params[:show_id])
    show.update_attributes(recording: false)
    show.update_attributes(box_id: nil)
    redirect_to :back
  end

  private

    def box_one
      Box.find_by(:box_number => 1)
    end

    def box_two
      Box.find_by(:box_number => 2)
    end

    def record_show(box, show)
      @overlapping_shows = box.shows.where(recording: true).where("start_time <= :show_end AND end_time >= :show_start", {show_start: show.start_time, show_end: show.end_time}).flatten.first

      if @overlapping_shows.present?
        # respond_to do |format|
        #   xhr :post, :record, format: :js
        # end
        # redirect_to action: 'index', via: :change_recording
        nil
      else
        show.update_attributes(:recording => true)
        show.save
      end
    end


end
