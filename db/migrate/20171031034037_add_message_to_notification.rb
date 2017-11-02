class AddMessageToNotification < ActiveRecord::Migration[5.0]
  def change
    # remove_column :badges, :message
    # remove_column :notifications, :weekday
    add_column :notifications, :message_sent , :integer
    add_column :badges, :dns, :string
    add_column :notifications, :weekday , :integer
  end
end
