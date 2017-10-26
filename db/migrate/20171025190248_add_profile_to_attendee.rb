class AddProfileToAttendee < ActiveRecord::Migration[5.0]
  def change
    add_reference :attendees, :profile, index: true
  end
end
