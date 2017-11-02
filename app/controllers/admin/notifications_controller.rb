module Admin
  class NotificationsController < Admin::ApplicationController
    before_action :set_badge, only: [:show, :update, :destroy]

    # GET /badge
    def index
      @notifications = Notification.all
      if params[:order]=="id"
        @notifications = Notification.all.order(id: :asc)
      elsif   params[:order]=="name"
        @notifications = Notification.all.sort_by{ |m| m.badge.attendee.user.name.downcase }
      end
    end

    # GET /badge/1
    def show
    end

    def new
      @notification = Notification.new
    end

    # POST /badge
    def create
      @notification = Notification.new(badge_params)
      if @notification.save
          redirect_to admin_notifications_path, notice: 'Notification was successfully updated.'
      else
        render :new
      end
    end

    def update
      if @notification.update(badge_params)
      else
        render :edit
      end
    end

    def destroy
      @notification.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_badge
        @notification = Notification.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def badge_params
        params.require(:notification).permit(:badge_id, :message_sent)
      end
  end
end
