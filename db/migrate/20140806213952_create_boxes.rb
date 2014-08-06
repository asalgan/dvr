class CreateBoxes < ActiveRecord::Migration
  def change
    create_table :boxes do |t|
    	t.integer :box_number
    	t.integer :dvr_system_id
      t.timestamps
    end
  end
end
