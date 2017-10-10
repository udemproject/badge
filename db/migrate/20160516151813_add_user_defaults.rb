class AddUserDefaults < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :role, :integer, default: 0
    change_column :users, :shirt_size, :integer, default: 2
  end
end
