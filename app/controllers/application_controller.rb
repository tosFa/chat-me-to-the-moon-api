require 'pagination'

class ApplicationController < ActionController::Base
  before_action :authenticate_with_token!, only: [:show, :update, :destroy, :me ]
  respond_to :json
  protect_from_forgery with: :null_session
  include Authenticable
  include Rails::Pagination

end
