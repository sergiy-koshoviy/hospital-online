class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.string :address_line1
      t.string :address_line2
      t.string :city
      t.string :state_id
      t.string :country_id
      t.string :zip_code

      t.timestamps
    end
  end
end
