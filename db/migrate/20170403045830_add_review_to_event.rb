class AddReviewToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :review, :boolean
  end
end
