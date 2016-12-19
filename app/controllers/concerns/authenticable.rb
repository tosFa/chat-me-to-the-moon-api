module Authenticable

  # Devise methods overwrites
  def current_user
    auth = request.headers['Authorization']
    @current_user ||= User.where("auth_token='#{auth}' AND confirmation_token IS NOT NULL").first
  end

  def authenticate_with_token!
    render json: { errors: "Not authenticated" },
                status: :unauthorized unless current_user.present?
  end

  def user_signed_in?
    current_user.present?
  end
end
