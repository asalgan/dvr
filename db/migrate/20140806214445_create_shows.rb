class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
    	t.integer :box_id
    	t.string :title
    	t.integer :channel
    	t.boolean :single_recording, default: true
      t.timestamps
    end
  end
end
