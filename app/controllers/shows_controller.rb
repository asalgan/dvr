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
    show = Show.find(params[:show_id])
    show.box_id = params[:show][:box_id]

    if show.box.box_number == 1
      Show.record_show(box_one, show)
    elsif show.box.box_number == 2
      Show.record_show(box_two, show)
    end
    redirect_to :back
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


end
