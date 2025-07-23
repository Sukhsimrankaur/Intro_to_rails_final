class AddSpeciesToMosquitoReadings < ActiveRecord::Migration[8.0]
  def change
    add_column :mosquito_readings, :species, :string
  end
end
