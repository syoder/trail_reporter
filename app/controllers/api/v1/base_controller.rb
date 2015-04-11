class Api::V1::BaseController < ActionController::Base
  helper_method :current_user
  before_action :authenticate_via_token!

  def authenticate_via_token!
    if api_token && current_user
      User.find_by(api_token: api_token)
      return true
    else
      render json: {error: '401 Unauthorized'}, status: :unauthorized
      return false
    end
  end

  def current_user
    @current_user ||= User.find_by(api_token: api_token)
  end

  def api_token
    params[:token]
  end
end
