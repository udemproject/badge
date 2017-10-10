class CreateBadge < ActiveRecord::Migration[5.0]
  def change
    create_table :badges do |t|
      t.references :user, foreign_key: true
      t.string :message
      t.integer :sound
    end
  end
end
