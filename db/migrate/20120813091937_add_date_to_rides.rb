class AddDateToRides < ActiveRecord::Migration
  def change
    add_column :rides, :date, :datetime
  end
end
