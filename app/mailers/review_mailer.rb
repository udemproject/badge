class ReviewMailer < ApplicationMailer
  def review_invite(attendee)
    @user = attendee.user
    @event = attendee.event
    mail(to: @user.email, subject: "💯 Evalúa tu experiencia en #{@event.name}")
  end
end
