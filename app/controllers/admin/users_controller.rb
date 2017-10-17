module Admin
  class UsersController < Admin::ApplicationController
    before_action :set_user, only: %i[show update destroy edit]

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
      @user.destroy
      redirect_to admin_users_path, notice: 'User was successfully Destroyed.'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :shirt_size)
    end
  end
end
