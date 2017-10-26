class RemoveMessageFromBadge < ActiveRecord::Migration[5.0]
  def change
    remove_column :badges, :message
    remove_column :badges, :user_id
    remove_column :badges, :sound
    add_reference :badges, :attendee, index: true
    add_column :badges, :message, :integer
  end
end
