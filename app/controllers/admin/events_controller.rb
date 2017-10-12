module Admin
  class EventsController < Admin::ApplicationController
    before_action :set_event, only: %i[show update destroy edit]
    def index
      @event =  Event.all
    end

    def new
      @event =  Event.new
    end

    def edit; end

    def update
      if @event.update(card_params)
        redirect_to admin_attendees_path, notice: 'Attendee was successfully updated.'
      else
        render :edit
      end
    end

    def show; end

    def create
      @event = Event.new(card_params)
      if @event.save
        redirect_to admin_attendee, notice: 'Card was successfully created.'
      else
        render :new
      end
    end

    def destroy
      @event.destroy
      redirect_to admin_attendees_path, notice: 'Card was successfully Destroyed.'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def event_params
      params.require(:set_event).permit(:name, :starts_at, :finishes_at, :location_id)
    end
  end
end
