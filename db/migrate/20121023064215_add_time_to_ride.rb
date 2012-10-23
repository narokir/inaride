class AddTimeToRide < ActiveRecord::Migration
  def change
    add_column :rides, :time, :time
  end
end
