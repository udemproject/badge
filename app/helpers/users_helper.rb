module UsersHelper
  def submit_button_text
    return 'Continuar' if current_user.pending_invitations?
    'Actualizar'
  end
end
