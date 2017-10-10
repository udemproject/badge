class Event::SessionsController < ApplicationController
  def create
    @event = Event.find_by(slug: (env['omniauth.params'] || session['omniauth.params'])['event'] || params[:event]) if (env['omniauth.params'] || session['omniauth.params'] || params[:event])
    user = User.from_omniauth(env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_decisions
  end

  def new
    redirect_decisions if current_user
  end

  def destroy
    session[:user_id] = nil
    redirect_to event_main_path
  end
end
