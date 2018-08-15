class SessionsController < Devise::SessionsController
  respond_to :json

  def create
    super { @token = current_token }
  end

  def show
    render json: {id: current_user.id, email: current_user.email} if user_signed_in?
  end

  private
  def respond_with(resource, _opts = {})
    render json: {token: @token}
  end

  def respond_to_on_destroy
    head :no_content
  end

  def current_token
    request.env['warden-jwt_auth.token']
  end
end
