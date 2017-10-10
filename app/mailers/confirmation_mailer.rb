class ConfirmationMailer < ApplicationMailer
  def invitation_accepted(invitation)
    @user = invitation.user
    @event = invitation.event
    @location = @event.location
    mail(to: @user.email, subject: "🚀 #{@event.name}: invitación confirmada")
  end
end
