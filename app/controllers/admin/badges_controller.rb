module Admin
  class BadgesController < Admin::ApplicationController
    before_action :set_badge, only: [:show, :update, :destroy]

    # GET /badge
    def index
      @badges = Badge.all
    end

    # GET /badge/1
    def show
    end

    def new
      @badge = Badge.new
    end

    # POST /badge
    def create
      @badge = Badge.new(badge_params)
      if @badge.save
          redirect_to admin_badges_path, notice: 'Badge was successfully updated.'
      else
        render :new
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
        params.require(:badge).permit(:user_id, :message, :sound)
      end
  end
end
