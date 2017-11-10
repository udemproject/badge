module Admin
  class LocationsController < Admin::ApplicationController
    before_action :set_location, only: [:show,  :update,  :destroy,  :edit]
    def index
      @locations = Location.all
      if params[:order] == "name"
        @locations = Location.all.order(name: :asc)
      elsif params[:order] == "id"
        @locations = Location.all.order(id: :asc)
      end
    end

    def new
      @location =  Location.new
    end

    def edit; end

    def update
      if @location.update(location_params)
        redirect_to admin_locations_path, notice: 'Location was successfully updated.'
      else
        render :edit
      end
    end

    def show; end

    def create
      @location = Location.new(location_params)
      if @location.save
        redirect_to admin_locations_path, notice: 'Location was successfully created.'
      else
        render :new
      end
    end

    def destroy
      @location.destroy
      redirect_to admin_locations_path, notice: 'Location was successfully Destroyed.'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def location_params
      params.require(:location).permit(:name, :gmaps_url, :address)
    end
  end
end
