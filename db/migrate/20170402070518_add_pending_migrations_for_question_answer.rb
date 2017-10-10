class AddPendingMigrationsForQuestionAnswer < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :individual, :boolean, null: false, default: false
    add_column :reviews, :event_id, :integer, index: true
    add_foreign_key :reviews, :events
  end
end
