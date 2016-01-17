class CreateMedicalHistoriesSymptoms < ActiveRecord::Migration
  def change
    create_table :medical_histories_symptoms, id: false do |t|
      t.integer :medical_history_id, index: true, null: false
      t.integer :symptom_id, index: true, null: false
    end
  end
end
