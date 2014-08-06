class CreateDvrSystems < ActiveRecord::Migration
  def change
    create_table :dvr_systems do |t|
    	t.integer :user_id
      t.timestamps
    end
  end
end
