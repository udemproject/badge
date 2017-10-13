module Admin
  class ProfilesController < Admin::ApplicationController
    before_action :set_profiles, only: %i[show update destroy edit]
    def index
      @profiles =  Profile.all
    end

    def new
      @profiles =  Profile.new
    end

    def edit; end

    def update
      if @profiles.update(profiles_params)
        redirect_to admin_attendees_path, notice: 'Attendee was successfully updated.'
      else
        render :edit
      end
    end

    def show; end

    def create
      @profiles = Profile.new(profiles_params)
      if @profiles.save
        redirect_to admin_attendee, notice: 'Profile was successfully created.'
      else
        render :new
      end
    end

    def destroy
      @profiles.destroy
      redirect_to admin_attendees_path, notice: 'Card was successfully Destroyed.'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_profiles
      @profiles = Profile.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def profiles_params
      params.require(:set_attende).permit(:name)
    end

  end
end
