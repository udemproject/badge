module Admin
  class BadgesController < Admin::ApplicationController
      before_action :set_badge, only: [:edit, :update ]
    # To customize the behavior of this controller,
    # simply overwrite any of the RESTful actions. For example:
    #
     def index
       super
       @resources = Badge.page(params[:page]).per(10)
     end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Badge.find_by!(slug: param)
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information

    #  def updated
    #      if params[:search]
    #        @badge = Badge.search(params[:search])
    #      else
    #        @badge = Badge.all
    #      end
    #  end
    #
    # def self.search(search)
    #     where('name LIKE ?', "%#{search}%")
    # end
    def edit
      @user = User.all
    end
    


      def set_badge
        @badge = Badge.find(params[:id])
      end

    # Never trust parameters from the scary internet, only allow the white list through.
    def badge_params
      params.require(:badge).permit(:user_id, :message, :sound)
    end
  end
end
