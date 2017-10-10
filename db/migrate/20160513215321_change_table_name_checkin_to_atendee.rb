class ChangeTableNameCheckinToAtendee < ActiveRecord::Migration[5.0]
  def change
    rename_table :checkins, :attendees
    add_belongs_to :attendees, :team, foreign_key: true
  end
end
