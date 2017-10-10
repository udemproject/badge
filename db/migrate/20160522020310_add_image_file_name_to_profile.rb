class AddImageFileNameToProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :image_filename, :string
  end
end
