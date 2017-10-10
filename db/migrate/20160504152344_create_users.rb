class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.belongs_to :profile, foreign_key: true
      t.string :provider
      t.string :uid
      t.string :oauth_token
      t.string :oauth_expires_at
      t.string :name
      t.string :email
      t.string :image_url
      t.integer :role
      t.integer :shirt_size

      t.timestamps
    end
  end
end
