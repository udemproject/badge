class RemoveAtributesFromEvents < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :image_id, :string
    remove_column :events, :choose_team, :boolean
    remove_column :events, :label_xml, :text
    remove_column :events, :checkin, :boolean
    remove_column :events, :agenda_image_id, :string
    remove_column :events, :agenda_image_filename, :string
  end
end
