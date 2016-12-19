class UserSerializer < BaseSerializer
  attributes :id, :email, :auth_token, :created_at, :confirmation_token, :resource
  def resource
    api_user_path(object.id)
  end
end
