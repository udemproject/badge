module Api
  class BadgesController < Admin::ApplicationController
    before_action :set_badge, only: [:show, :update, :destroy]

    # GET /badge
    def index
      @badge = Badge.all

      render json: @badge
    end

    # GET /badge/1
    def show
      render json: @badge
    end

    # POST /badge
    def create
      @badge = Badge.new(badge_params)

      if @badge.save
        render json: @badge, status: :created, location: @badge
      else
        render json: @badge.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /badge/1
    def update
      if @badge.update(badge_params)
        render json: @badge
      else
        render json: @badge.errors, status: :unprocessable_entity
      end
    end

    # DELETE /badge/1
    def destroy
      @badge.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_badge
        @badge = Badge.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def badge_params
        params.require(:badge).permit(:user_id , :message, :sound)
      end
  end
end
