class ApplicationController < ActionController::Base
  before_action :authenticate_with_token!, only: [:show, :update, :destroy, :me ]
  respond_to :json
  protect_from_forgery with: :null_session
  include Authenticable
  include Rails::Pagination

  private
    def pagination_dict(object)
      {
        current_page: object.current_page,
        next_page: object.next_page,
        prev_page: object.prev_page, # use object.previous_page when using will_paginate
        total_pages: object.total_pages,
        total_count: object.total_count
      }
    end
end
