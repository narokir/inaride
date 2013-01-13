class AddGenderEducationToUser < ActiveRecord::Migration
  def change
    add_column :users, :gender, :string
    add_column :users, :education, :string
  end
end
