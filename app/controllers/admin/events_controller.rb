module Admin
  class EventsController < Admin::ApplicationController
    before_action :set_event, only: [:show, :update, :destroy, :edit]

    def index
      @events = Event.all
      if params[:order] == "name"
        @events = Event.all.order(name: :asc)
      end
    end

    def new
      @event = Event.new
    end

    def edit; end

    def update
      if @event.update(event_params)
        redirect_to admin_events_path, notice: 'Event was successfully updated.'
      else
        render :edit
      end
    end

    def show; end

    def create
      @event = Event.new(event_params)
      if @event.save
        User.all.each do |user|
          invitation = Invitation.new(user_id: user.id, event_id: @event.id)
          invitation.save
        end
        redirect_to action: show, slug: @event.slug, notice: 'Event was successfully created.'
      else
        render :new
      end
    end

    def destroy
      @event.destroy
      flash[:notice] = 'Se borro la Evento'
      redirect_to admin_events_path, notice: 'Event was successfully Destroyed.'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:slug])
    end

    # Only allow a trusted parameter "white list" through.
    def event_params
      params.require(:event).permit(:name, :starts_at, :finishes_at, :location_id, :image)
    end
  end
end
