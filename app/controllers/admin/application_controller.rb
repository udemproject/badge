module Admin
  class Admin::ApplicationController < ActionController::Base
    layout 'application.html.erb'

    # http_basic_authenticate_with name: ENV['LOGIN_NAME'], password: ENV['LOGIN_PASSWORD']
    before_filter :default_params

    def default_params
      params[:order] ||= "created_at"
      params[:direction] ||= "desc"
    end

    private

    def resource_params
      json_keys = dashboard.attribute_types.select { |_k, val| val == Administrate::Field::JSON }.keys
      permited_params = params.require(resource_name).permit(dashboard.permitted_attributes)
      json_keys.each do |json_key|
        permited_params[json_key] = JSON.parse(permited_params[json_key]) if permited_params[json_key]
      end
      permited_params
    end
  end
end
