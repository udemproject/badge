class AddAgendaImageToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :agenda_image_id, :string
  end
end
