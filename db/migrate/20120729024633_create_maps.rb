class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.string :title
      t.string :origin
      t.string :destination
      t.float :longitude
      t.float :latitude
      t.string :waypoint_1
      t.boolean :gmaps

      t.timestamps
    end
  end
end
