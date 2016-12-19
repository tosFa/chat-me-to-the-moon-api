class AddContactEmailAndUserIdToOrganizations < ActiveRecord::Migration[5.0]
  def change
    add_column :organizations, :contact_email, :string
    add_column :organizations, :user_id, :int
  end
end
