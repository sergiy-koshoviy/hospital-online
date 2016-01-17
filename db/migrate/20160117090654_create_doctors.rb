class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :name
      t.integer :doctors_category_id
      t.string :address
      t.string :phone

      t.timestamps
    end
  end
end
