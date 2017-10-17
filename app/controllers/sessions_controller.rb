class SessionsController < ApplicationController
  before_action :sessions_params, only: %i[create2]
  def create
    slug = env.dig('omniauth.params', 'event') || params[:event]
    @event = Event.find_by(slug: slug)
    user = User.from_omniauth(env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_decisions
  end

  def new
    redirect_to new_user_path if current_user
  end

  def create2
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
      # Log the user in and redirect to the user's show page.
    else
      flash[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'login'
    end
  end

  def login

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  def sessions_params
    params.require(:session).permit(:email, :password)
  end
end
