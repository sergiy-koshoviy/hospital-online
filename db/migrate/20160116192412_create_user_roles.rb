class CreateUserRoles < ActiveRecord::Migration
  def change
    create_table :user_roles do |t|
      t.string :name

      t.timestamps
    end

    UserRole.create(name: 'patient')
    UserRole.create(name: 'doctor')
  end
end
