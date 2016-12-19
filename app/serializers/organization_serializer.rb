class OrganizationSerializer < BaseSerializer
  attributes :id, :name, :resource
  has_one :user, :serializer => EmbeddedUserSerializer
  def resource
    api_organization_path(object.id)
  end
end
