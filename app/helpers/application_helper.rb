module ApplicationHelper
  def logout_header
    return link_to 'Log out', logout_path, class: 'btn btn-outline-danger nav-item' if current_user
  end

  def pending_invitations_header
    link_to 'Invitaciones pendientes', invitations_path, class: 'btn btn-outline-primary nav-item' if current_user&.pending_invitations?
  end
end
