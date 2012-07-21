class CreateRides < ActiveRecord::Migration
  def change
    drop_table :rides
    create_table :rides do |t|
      t.string :origin
      t.string :destination
      t.date :date
      t.integer :user_id

      t.timestamps
    end
  end
end
