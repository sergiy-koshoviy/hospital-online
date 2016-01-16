class CreateUserRolesUsers < ActiveRecord::Migration
  def change
    create_table :user_roles_users, id: false do |t|
      t.integer :user_id, index: true, null: false
      t.integer :user_role_id, index: true, null: false
    end
  end
end
