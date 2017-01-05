class OrganizationSerializer < BaseSerializer
  attributes :id, :name, :contact_email, :resource
  has_one :user, :serializer => EmbeddedUserSerializer

  def resource
    api_organization_path(object.id)
  end

end
