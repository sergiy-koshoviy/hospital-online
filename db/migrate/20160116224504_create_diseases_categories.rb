class CreateDiseasesCategories < ActiveRecord::Migration
  def change
    create_table :diseases_categories do |t|
      t.string :name
      t.string :doctors_category_id
    end
  end
end
