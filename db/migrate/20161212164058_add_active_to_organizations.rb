class AddActiveToOrganizations < ActiveRecord::Migration[5.0]
  def change
    add_column :organizations, :active, :boolean, default: false
  end
end
