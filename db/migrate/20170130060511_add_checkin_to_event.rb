class AddCheckinToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :checkin, :boolean, default: false
  end
end
