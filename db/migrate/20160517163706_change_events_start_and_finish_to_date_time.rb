class ChangeEventsStartAndFinishToDateTime < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :starts_at
    remove_column :events, :finishes_at

    add_column :events, :starts_at, :datetime
    add_column :events, :finishes_at, :datetime
  end
end
