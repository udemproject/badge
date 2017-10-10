class ChangeTeamProfilesDefault < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:teams, :profiles, {})
  end
end
