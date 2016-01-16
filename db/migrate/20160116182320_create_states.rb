class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.integer :country_id
      t.string :code
      t.string :url
      t.string :name
      t.float :latitude
      t.float :longitude
      t.integer :cities

      t.timestamps
    end
  end
end
