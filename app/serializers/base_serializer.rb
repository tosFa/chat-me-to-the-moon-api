class BaseSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  type 'data'

  # def initialize(object, options={})
  #
  #   meta_key = options[:meta_key] || :meta
  #   options[meta_key] ||= {}
  #
  #   options[meta_key][:pagination] = {
  #     page: options[:params][:page].to_i,
  #     perPage: options[:params][:per_page],
  #     totalPages: (Organization.all.size/options[:params][:per_page].to_f)
  #   }
  #
  #   super(object, options)
  # end
end
