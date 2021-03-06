class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy, :edit]

  def edit
  end

  def show
  end

  def index

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      remember(@user)
      redirect_to user_path(id: @user.id), notice: 'User was successfully created.'
    else
      flash[:alert] = 'No se pudo crear la cuenta'
      render :new
    end
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
    params.require(:user).permit(:name, :email, :password, :shirt_size, :avatar)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_next_path
    return invitations_path if current_user.pending_invitations?
    redirect_to @user
  end
end
