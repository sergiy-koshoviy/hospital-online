class CreateMedicalHistories < ActiveRecord::Migration
  def change
    create_table :medical_histories do |t|
      t.integer :user_id
      t.integer :diseases_category_id
      t.text :description

      t.timestamps
    end
  end
end
