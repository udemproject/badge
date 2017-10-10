class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :starts_at
      t.string :finishes_at
      t.string :image_id

      t.timestamps
    end
  end
end
