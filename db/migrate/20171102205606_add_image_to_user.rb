class AddImageToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :image_id, :string
    remove_column :users, :image_url, :string
  end
end
