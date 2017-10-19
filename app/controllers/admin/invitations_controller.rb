module Admin
  class InvitationsController < Admin::ApplicationController
    before_action :set_invitation, only: [:update, :destroy]

    def update
      if @location.update(location_params)
        redirect_to admin_location_path, notice: 'Location was successfully updated.'
      else
        render :edit
      end
    end

    def index
      @invitation = Invitation.all
    end

    def create
      @invitation = Invitation.new(location_params)
      if @invitation.save
      else
        render :new
      end
    end

    def destroy
      @Invitation.destroy
      flash[:notice] = 'Se borro la invitacion'
    end

    private

    def set_invitation
      @invitation = Invitation.find(params[:id])
    end

    def invitation_params
      params.require(:invitation).permit(:user_id, :event_id, :status)
    end
  end
end
