class AddProfilesToTeams < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :profiles, :json, default: '{}'
  end
end
