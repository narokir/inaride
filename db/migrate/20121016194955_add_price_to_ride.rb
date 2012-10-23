class AddPriceToRide < ActiveRecord::Migration
  def change
    add_column :rides, :price, :integer
  end
end
