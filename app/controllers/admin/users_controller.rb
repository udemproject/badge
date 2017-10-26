module Admin
  class UsersController < Admin::ApplicationController
    before_action :set_user, only: [:show, :update, :destroy, :edit, :editProfile, :updateProfile]

    def index
      @users =  User.all
    end

    def new
      @user = User.new
    end

    def edit; end

    def editProfile; end

    def update
      if @user.update(user_params)
        redirect_to admin_users_path
      else
        render :edit
      end
    end

    def updateProfile
      if @user.update(profileUser_params)
        redirect_to admin_users_path
      else
        render :editProfile
      end
    end

    def show; end

    def create
      @user = User.new(user_params)
      if @user.save
        flash.keep[:notice] = 'User was successfully updated.'
        Event.where('starts_at <= ?', Date.today).each do |event|
          invitation = Invitation.new(user_id: @user.id, event_id: event.id)
          invitation.save
        end
        redirect_to admin_users_path
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
      flash.keep[:notice] = 'User was successfully deleted.'
      redirect_to admin_users_path, notice: 'User was successfully updated.'
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

    def profileUser_params
      params.require(:user).permit(:name, :email, :profile_id)
    end
  end
end
