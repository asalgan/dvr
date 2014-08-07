class AddStartTimeAndEndTimeToShows < ActiveRecord::Migration
  def change
  	add_column :shows, :start_time, :datetime
  	add_column :shows, :end_time, :datetime
  end
end
