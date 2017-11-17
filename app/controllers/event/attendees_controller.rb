# class Event::AttendeesController < ApplicationController
#   def new
#     redirect_to edit_user_path unless current_event.checkin?
#     redirect_to event_select_path unless Attendee.find_by(user: current_user, event: current_event).nil?
#   end
#
#   def create
#     if Attendee.create(user: current_user, event: current_event)
#       flash[:notice] = 'Tu check-in ha quedado registrado.'
#       Pusher.trigger('printer-channel', 'printer', user: current_user, event: current_event.id)
#       redirect_to event_select_path(current_event)
#     else
#       render event_main_path
#     end
#   end
# end
