class RemoveColumnsFromRide < ActiveRecord::Migration
  def up
    remove_column :rides, :date
  end

  def down
    add_column :rides, :date, :string
  end
end
