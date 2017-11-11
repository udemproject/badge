module Admin
  class NotificationsController < Admin::ApplicationController

    # GET /badge
    def index
      @notifications = Notification.all
      if params[:order]=="id"
        @notifications = Notification.all.order(id: :asc)
      elsif   params[:order]=="name"
        @notifications = Notification.all.sort_by{ |m| m.badge.attendee.user.name.downcase }
      end
    end


    def new
      @notifications = []
      @badges = []
      # acabar esto mañana
      if params[:team_id]
        @team = Event.find(params[:event_id]).teams
      elsif params[:team_id] == "-1"
        attendees  =  Event.find(params[:event_id]).attendees
        @badges = attendees[0].find_badges(attendees)
        @badges.each do |badge|
          @notifications << Notification.new(badge_id: badge.id)
        end
      elsif params[:team_id].to_i >= 0 && params[:team_id]
        attendees = Team.find(params[:team_id]).attendees
        @badges = attendees[0].find_badges(attendees)
      else
        @badges =Badge.all
        @notifications << Notification.new
      end
    end

    # POST /badge
    def create
      params["notifications"].each do |notification|
         if puppy["badge_id"] != "" || puppy["message_sent"] != ""
           Notification.create(notification_params(notification))
         end
      # if @notification.save
      #     redirect_to admin_notifications_path, notice: 'Notification was successfully updated.'
      # else
      #   render :new
      # end
      end
    end








    def destroy
      @notification.destroy
    end
    private
      # Use callbacks to share common setup or constraints between actions.
      # def set_notification
      #   @notification = Notification.find(params[:id])
      # end

      # Only allow a trusted parameter "white list" through.
      def notification_params(my_params)
        my_params.permit(:badge_id, :message_sent)
      end
  end
end
