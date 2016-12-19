class Api::V1::OrganizationsController < ApplicationController
  def index
    organizations = paginate Organization.all

    render json: organizations, :each_seralizer => OrganizationSerializer
  end

  def show
    organization = Organization.find(params[:id])

    respond_with organization
  end

  def create
    organization = Organization.new(organization_params)
    organization.user = current_user
    if organization.save
      render json: organization, status: 201, location: [:api, organization]
    else
      render json: { errors: organization.errors }, status: 422
    end
  end

  private

    def organization_params
      params.require(:organization).permit(:name, :contact_email)
    end
end
