class Api::V1::ConfirmationsController < Devise::ConfirmationsController
  skip_before_action :authenticate_with_token!, :only => [:show]

  def show
    self.resource = resource_class.confirm_by_token(params[:confirmation_token])
    yield resource if block_given?

    if resource.errors.empty?
      render json: resource, status: 201, location: [:api, resource]
    else
      render json: { errors: resource.errors }, status: :unprocessable_entity
    end
  end
end
