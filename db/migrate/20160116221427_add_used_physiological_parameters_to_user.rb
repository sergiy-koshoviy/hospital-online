class AddUsedPhysiologicalParametersToUser < ActiveRecord::Migration
  def change
    add_column :users, :blood_pressure, :string
    add_column :users, :growth, :string
  end
end
