module Admin
  class UsersController < Admin::ApplicationController
    before_action :set_user, only: [:show, :update, :destroy, :edit]

    def index
      @users =  User.all
    end

    def new
      @user = User.new
    end

    def edit; end

    def update
      if @user.update(user_params)
        redirect_to admin_users_path, notice: 'User was successfully updated.'
      else
        render :edit
      end
    end

    def show; end

    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to admin_users_path, notice: 'User was successfully created.'
      else
        render :new
      end
    end

    def destroy
      if Badge.find_by(user_id:@user.id)
        badge =  Badge.find_by(user_id:@user.id)
        Notification.find_by(badge_id: badge.id).destroy if Notification.find_by(badge_id: badge.id)
        badge.destroy
        @user.destroy
      else
        @user.destroy
      end
      redirect_to admin_users_path, notice: 'User was successfully Destroyed.'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :shirt_size, :avatar)
    end
  end
end
