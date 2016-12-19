class EmbeddedUserSerializer < BaseSerializer
  attributes :id, :url
  def url
    api_user_path(object.id)
  end
end
