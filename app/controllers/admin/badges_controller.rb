module Admin
  class BadgesController < Admin::ApplicationController
      before_action :set_badge, only: [:edit, :update ]

    #
     def index
       super
       @resources = Badge.page(params[:page]).per(10)
     end

    def edit
      @user = User.all
    end



      def set_badge
        @badge = Badge.find(params[:id].to_i)
      end

    # Never trust parameters from the scary internet, only allow the white list through.
    def badge_params
      params.require(:badge).permit(:user_id, :message, :sound)
    end
  end
end
