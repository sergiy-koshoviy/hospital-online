class CreateUserRolesUsers < ActiveRecord::Migration
class Address < ActiveRecord::Base
  attr_accessible :address_line1, :address_line2, :city, :country_id, :state_id, :user_id, :zip_code

  belongs_to :user
  belongs_to :country
  belongs_to :state
end

  def change
    create_table :user_roles_users, id: false do |t|
      t.integer :user_id, index: true, null: false
      t.integer :user_role_id, index: true, null: false
    end
  end
end
