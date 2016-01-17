class CreateDoctorsCategories < ActiveRecord::Migration
  def change
    create_table :doctors_categories do |t|
      t.string :name
    end
  end
end
