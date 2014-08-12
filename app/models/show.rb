class Show < ActiveRecord::Base
	belongs_to :box


  def self.record_show(box, show)
    overlapping_shows = box.shows.where(recording: true).where("start_time <= :show_end AND end_time >= :show_start", {show_start: show.start_time, show_end: show.end_time}).flatten.first
    # shows = box.shows.where(:recording => true).flatten
    # show_start_and_end_times = shows.collect {|x| x.start_time..x.end_time}
    # current_show_time = show.start_time..show.end_time
    # overlap = show_start_and_end_times.select {|c| current_show_time.overlaps?(c)}

    if overlapping_shows.present?
      nil
    else
      show.update_attributes(:recording => true)
      show.save
    end
  end


end
