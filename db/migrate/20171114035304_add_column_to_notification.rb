class AddColumnToNotification < ActiveRecord::Migration[5.0]
  def change
    add_column :notifications, :active, :boolean, default: true
  end
end
