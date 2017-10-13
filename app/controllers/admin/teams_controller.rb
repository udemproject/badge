module Admin
  class TeamsController < Admin::ApplicationController
    before_action :set_teams, only: %i[show update destroy edit]

    def index
      @teams =  Team.all
    end

    def new
      @teams =  Team.new
    end

    def edit; end

    def update
      if @teams.update(team_params)
        redirect_to admin_attendees_path, notice: 'Attendee was successfully updated.'
      else
        render :edit
      end
    end

    def show; end

    def create
      @teams = Team.new(team_params)
      if @teams.save
        redirect_to admin_attendee, notice: 'Card was successfully created.'
      else
        render :new
      end
    end

    def destroy
      @teams.destroy
      redirect_to admin_attendees_path, notice: 'Card was successfully Destroyed.'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_teams
      @teams = Team.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def team_params
      params.require(:set_event).permit(:name, :starts_at, :finishes_at, :location_id)
    end

  end
end
