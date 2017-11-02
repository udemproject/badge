module Admin
  class ProfilesController < Admin::ApplicationController
    before_action :set_profiles, only: %i[show update destroy edit]
    def index
      @profiles =  Profile.all
      if params[:order] == "name"
        @profiles = Profile.all.order(name: :asc)
      end
    end

    def new
      @profile =  Profile.new
    end

    def edit; end

    def update
      if @profile.update(profiles_params)
        redirect_to admin_profiles_path, notice: 'Attendee was successfully updated.'
      else
        render :edit
      end
    end

    def show; end

    def create
      @profile = Profile.new(profiles_params)
      if @profile.save
        redirect_to admin_profiles_path, notice: 'Profile was successfully created.'
      else
        render :new
      end
    end

    def destroy
      @profiles.destroy
      redirect_to admin_profiles_path, notice: 'Card was successfully Destroyed.'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_profiles
      @profile = Profile.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def profiles_params
      params.require(:profile).permit(:name)
    end

  end
end
