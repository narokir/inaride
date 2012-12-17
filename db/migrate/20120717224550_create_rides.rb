class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.string :origin
      t.string :destination
      t.date :date
      t.integer :user_id
      
      t.timestamps
    end
    add_index :rides, [:user_id, :created_at]
  end
end
