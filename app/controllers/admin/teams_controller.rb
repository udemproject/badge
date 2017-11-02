module Admin
  class TeamsController < Admin::ApplicationController
    before_action :set_teams, only: %i[show update destroy edit]

    def index
      @teams =  Team.all
      if params[:order]== "name"
        @teams = Team.all.order(name: :asc)
      elsif params[:order] == "name_event"
        @teams = Team.all.sort_by{ |m| m.event.name.downcase }
      end
    end

    def new
      @team =  Team.new
    end

    def edit; end

    def update
      if @team.update(team_params)
        redirect_to admin_teams_path, notice: 'Team was successfully updated.'
      else
        render :edit
      end
    end

    def show; end

    def create
      @team = Team.new(team_params)
      if @team.save
        redirect_to admin_teams_path, notice: 'Team was successfully created.'
      else
        render :new
      end
    end

    def destroy
      @team.destroy
      redirect_to admin_teams_path, notice: 'Team was successfully Destroyed.'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_teams
      @team = Team.find(params[:id].to_i)
    end

    # Only allow a trusted parameter "white list" through.
    def team_params
      params.require(:team).permit(:name, :event_id)
    end

  end
end
