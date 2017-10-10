class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.references :badge, foreign_key: true
      t.string :message
      t.time :time
      t.string :weekday

      t.timestamps
    end
  end
end
