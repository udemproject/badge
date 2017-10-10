class AddCellphoneToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :cellphone, :integer, limit: 8
  end
end
