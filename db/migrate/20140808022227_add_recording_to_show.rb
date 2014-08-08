class AddRecordingToShow < ActiveRecord::Migration
  def change
  	add_column :shows, :recording, :boolean, default: false
  end
end
