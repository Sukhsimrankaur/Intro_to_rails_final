class CreateMosquitoReadings < ActiveRecord::Migration[8.0]
  def change
    create_table :mosquito_readings do |t|
      t.references :mosquito_trap, null: false, foreign_key: true
      t.date :date
      t.integer :count

      t.timestamps
    end
  end
end
