class ChangeUserSizeDefault < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :shirt_size, :integer, default: 1
  end
end
