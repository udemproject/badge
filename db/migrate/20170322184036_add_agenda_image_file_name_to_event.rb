class AddAgendaImageFileNameToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :agenda_image_filename, :string
  end
end
