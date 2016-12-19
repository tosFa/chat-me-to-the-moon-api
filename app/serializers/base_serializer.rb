class BaseSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  type 'data'
end
