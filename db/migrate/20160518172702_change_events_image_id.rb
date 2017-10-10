class ChangeEventsImageId < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :image_filename, :string
  end
end
