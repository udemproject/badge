class UsersController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    if current_user.update(user_params)
      redirect_to user_next_path, notice: 'Se actualizaron tus datos'
    else
      render :edit, notice: 'No se pudieron actualizar tus datos'
    end
  end

  def invitations
    if current_user.pending_invitations?
      @invitations = current_user.invitations.where(status: :pending)
    else
      redirect_to edit_user_path, notice: 'No tienes invitaciones pendientes.'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :shirt_size, :avatar)
  end

  def user_next_path
    return invitations_path if current_user.pending_invitations?
    edit_user_path
  end
end
