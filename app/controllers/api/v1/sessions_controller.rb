class Api::V1::SessionsController < Api::V1::BaseController
  skip_before_action :authenticate_via_token!, only: [:create]

  # curl -X POST http://localhost:3000/api/v1/sessions?email=yodersb@gmail.com&password=xxxxx
  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.valid_password?(params[:password])
      @user.generate_api_token!
      render json: {api_token: @user.api_token}
    else
      render json: {error: '401 Unauthorized'}, status: :unauthorized
    end
  end

  def destroy
    current_user.update!(api_token: nil)
    head :no_content
  end

end
