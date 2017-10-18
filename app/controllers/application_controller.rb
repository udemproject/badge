class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def require_login
    redirect_to event_main_url unless current_user
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def redirect_decisions
    @attendee = @event&.attendees&.find_by(user: current_user)
    @invitation = @event&.invitations&.find_by(user: current_user, event: @event)
    # Existe el evento y ya tienes equipo
    return redirect_to event_review_path(@event) if @event && @attendee&.team
    # Existe el evento y ya hiciste checkin
    return redirect_to event_select_path(@event) if @event && @attendee
    # Existe el evento y ya aceptace la invitation
    return redirect_to event_checkin_path(@event) if @event && @invitation&.accepted?
    # Existe el evento y la invitation esta pendiente
    return redirect_to invitations_path if @event && @invitation&.pending?
    redirect_to edit_user_path
  end
  helper_method :redirect_decisions

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def current_event
    @current_event ||= Event.find_by(slug: params[:event])
  end
  helper_method :current_event
end
