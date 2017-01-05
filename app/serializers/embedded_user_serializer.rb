class EmbeddedUserSerializer < BaseSerializer
  attributes :id, :resource
  def resource
    api_user_path(object.id)
  end
end
