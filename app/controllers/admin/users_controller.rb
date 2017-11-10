module Admin
  class UsersController < Admin::ApplicationController
    before_action :set_user, only: [:show, :update, :destroy, :edit, :editProfile, :updateProfile]

    def index
      @users =  User.all
      if params[:order]=="name"
        @users = User.all.order(name: :asc)
      elsif params[:order]=="id"
        @users = User.all.order(id: :asc)
      elsif params[:order]=="email"
        @users = User.all.order(email: :asc)
      end
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
        event = Event.all.where('events.finishes_at >= ?', Date.today)
        event.each do |events|
          a = Invitation.new(user_id: @user.id, event_id: events.id)
          a.save
        end
        redirect_to admin_users_path
      else
        render :new
      end
    end

    def destroy
        @user.destroy
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
