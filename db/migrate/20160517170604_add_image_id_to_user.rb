class AddImageIdToUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :identities, :image_id, :string
    add_column :users, :avatar_id, :string
  end
end
