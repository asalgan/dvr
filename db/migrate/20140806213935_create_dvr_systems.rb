class CreateDvrSystems < ActiveRecord::Migration
  def change
    create_table :dvr_systems do |t|

      t.timestamps
    end
  end
end
