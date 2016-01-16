class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.string :code
      t.string :url
      t.float :latitude
      t.float :longitude
      t.integer :states

      t.timestamps
    end
  end
end
