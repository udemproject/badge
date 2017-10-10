class IdentitiesController < ApplicationController
  def new
    flash.now[:alert] = @identity&.errors
    @identity = env['omniauth.identity']
    # flash.now[:alert] = @identity&.errors
  end

end
