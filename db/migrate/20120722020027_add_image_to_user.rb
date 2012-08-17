class AddImageToUser < ActiveRecord::Migration
  def change
    add_column :users, :usr_img, :string
  end
end
