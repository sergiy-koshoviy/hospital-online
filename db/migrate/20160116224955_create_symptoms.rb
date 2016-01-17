class CreateSymptoms < ActiveRecord::Migration
  def change
    create_table :symptoms do |t|
      t.string :name
      t.integer :diseases_category_id

      t.timestamps
    end
  end
end
