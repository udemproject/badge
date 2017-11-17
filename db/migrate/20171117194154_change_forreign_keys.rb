class ChangeForreignKeys < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :notifications, :badges
    remove_foreign_key :attendees, :users
    remove_foreign_key :teams, :events
    remove_foreign_key :attendees, :events

    add_foreign_key :notifications, :badges, on_delete: :cascade
    add_foreign_key :badges, :attendees, on_delete: :cascade
    add_foreign_key :teams, :events, on_delete: :cascade
    add_foreign_key :attendees, :users, on_delete: :cascade
    add_foreign_key :attendees, :events, on_delete: :cascade
  end
end
