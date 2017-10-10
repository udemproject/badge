class InvitationsController < ApplicationController
  before_action :set_invitation, only: [:accept, :reject]

  def accept
    if @invitation.update(status: :accepted)
      ConfirmationMailer.invitation_accepted(@invitation).deliver_later
      flash[:notice] = "Ya quedaste registrado al evento #{@invitation.event.name}."
      redirect_decisions
    else
      render invitations_path
    end
  end

  def reject
    if @invitation.update(status: :rejected)
      flash[:alert] = 'Rechazaste la invitación.'
      redirect_to edit_user_path
    else
      render invitations_path
    end
  end

  private

  def set_invitation
    @invitation = Invitation.find(params[:id])
  end
end
