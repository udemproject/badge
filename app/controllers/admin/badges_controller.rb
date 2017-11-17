module Admin
  class BadgesController < Admin::ApplicationController
    before_action :set_badge, only: [:show, :update, :destroy, :edit]

    # GET /badge
    def index
      @badges = Badge.all
      if params[:order]=="id"
        @badges = Badge.all.order(id: :asc)
      elsif   params[:order]=="name"
        @badges = Badge.all.sort_by{ |b| b.attendee.user.name.downcase }
      end
    end

    # GET /badge/1
    def show
    end

    def new
      @badge = Badge.new
      @attendees = Attendee.all
      @events = Event.all
      if(params[:event_id])
          @attendees = Attendee.all.where(event_id: params[:event_id].to_i)
      end
    end

    # POST /badge
    def create
      @badge = Badge.new(badge_params)
      if @badge.save
          redirect_to admin_badges_path, notice: 'Badge was successfully updated.'
      else
        render :new
      end
    end

    # PATCH/PUT /badge/1
    def update
      if @badge.update(badge_params)
      else
        render :edit
      end
    end

    def edit
      @events = Event.all
      @attendees = Attendee.all
    end

    # DELETE /badge/1
    def destroy
      @badge.destroy
      redirect_to admin_badges_path, notice: 'Badge was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_badge
        @badge = Badge.find(params[:id].to_i)
      end

      # Only allow a trusted parameter "white list" through.
      def badge_params
        params.require(:badge).permit(:attendee_id, :dns)
      end
  end
end
