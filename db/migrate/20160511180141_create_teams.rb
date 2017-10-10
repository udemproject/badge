class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.belongs_to :event, foreign_key: true

      t.timestamps
    end
  end
end
