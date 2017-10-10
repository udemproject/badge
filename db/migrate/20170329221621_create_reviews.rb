class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :stars
      t.text :answer
      t.belongs_to :question, foreign_key: true
      t.references :reviewee, foreign_key: { to_table: :users }
      t.references :reviewer, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
