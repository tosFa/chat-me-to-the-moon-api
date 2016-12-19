class Organization < ApplicationRecord
  include SoftDeletable
  belongs_to :user
end
