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
      @notification = Notification.new
      @events = Event.all

      if(params[:event_id])
        @show_event = Event.find(params[:event_id].to_i).name
        @team =  Event.find(params[:event_id].to_i).teams
        @block = true
      else
        @show_event = nil
          @block = false
      end
    end
    # def new
    #   @notifications = []
    #   @badges = []
    #   # acabar esto mañana
    #   if params[:team_id]
    #     @team = Event.find(params[:event_id]).teams
    #   elsif params[:team_id] == "-1"
    #     attendees  =  Event.find(params[:event_id]).attendees
    #     @badges = attendees[0].find_badges(attendees)
    #     @badges.each do |badge|
    #       @notifications << Notification.new(badge_id: badge.id)
    #     end
    #   elsif params[:team_id].to_i >= 0 && params[:team_id]
    #     attendees = Team.find(params[:team_id]).attendees
    #     @badges = attendees[0].find_badges(attendees)
    #   else
    #     @badges =Badge.all
    #     @notifications << Notification.new
    #   end
    # end

    # POST /badge
    def create

      # if(notification_params.team_id)
      # elsif notification_params.team_id == "-1"
      #   attendees  =  Event.find(otification_params.event_id.to_i).attendees
      #       @badges = attendees[0].find_badges(attendees)
      #       @badges.each do |badge|
      #         Notification.create(badge_id: badge.id, message_sent: notification_params.message_sent.to_i)
      #       end
      #
      #   elsif notification_params.team_id.to_i >= 0
      #     attendees  =  Team.find(notification_params.team_id.to_i).attendees
      #     @badges = attendees[0].find_badges(attendees)
      #     @badges.each do |badge|
      #       Notification.create(badge_id: badge.id, message_sent: notification_params.message_sent.to_i)
      #     end
      #
      #   else
      #       Notification.create(badge_id: notification_params.badge_id.to_i, message_sent: notification_params.message_sent.to_i)
      # end
    end


    private

    # Use callbacks to share common setup or constraints between actions.
    # def set_notification
    #   @notification = Notification.find(params[:id])
    # end

    # Only allow a trusted parameter "white list" through.
    def notification_params(my_params)
      my_params.require(:message_sent).permit(:badge_id, :team_id, :event_id)
    end
  end
end
