class CreateMosquitoTraps < ActiveRecord::Migration[8.0]
  def change
    create_table :mosquito_traps do |t|
      t.string :trap_id
      t.string :name
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
