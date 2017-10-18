module ApplicationHelper
  def logout_header
    return link_to 'Log out', logout_path, class: 'btn btn-outline-danger nav-item' if current_user
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
    @current_user = nil
  end

    def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  def pending_invitations_header
    link_to 'Invitaciones pendientes', invitations_path, class: 'btn btn-outline-primary nav-item' if current_user&.pending_invitations?
  end
end
