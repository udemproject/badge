module Admin
  class AttendeesController < Admin::ApplicationController
    before_action :set_attende, only: %i[show update destroy edit]
    def index
      @attendees =  Attendee.all
    end

    def new
      @attendee =  Attendee.new
    end

    def edit; end

    def update
      if @attendee.update(attendee_params)
        redirect_to admin_attendees_path, notice: 'Attendee was successfully updated.'
      else
        render :edit
      end
    end

    def show; end

    def create
      @attendee = Attendee.new(attendee_params)
      if @attendee.save
        redirect_to admin_attendee, notice: 'Attendee was successfully created.'
      else
        render :new
      end
    end

    def destroy
      @cards.destroy
      redirect_to admin_attendees_path, notice: 'Attendee was successfully Destroyed.'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_attende
      @attendee = Attendee.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def attendee_params
      params.require(:set_attende).permit(:user_id, :event_id, :team_id)
    end

  end
end
