class AddChooseTeamToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :choose_team, :boolean, default: false
  end
end
