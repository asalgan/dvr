class Show < ActiveRecord::Base
	belongs_to :box


  def self.record_show(box, show)
    shows = box.shows.where(:recording => true)
    current_show_time = show.start_time..show.end_time
    @current_saved_shows_array = []
    
    shows.each do |showtime|
      @current_saved_shows_array << (showtime.start_time..showtime.end_time)
    end

    if @current_saved_shows_array.select {|c| current_show_time.overlaps?(c)}.present?
      nil
    else
      show.update_attributes(:recording => true)
      show.save
    end
  end


end
