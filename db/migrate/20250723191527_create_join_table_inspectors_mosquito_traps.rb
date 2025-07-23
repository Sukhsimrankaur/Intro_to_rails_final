class CreateJoinTableInspectorsMosquitoTraps < ActiveRecord::Migration[8.0]
  def change
    create_join_table :inspectors, :mosquito_traps do |t|
      # t.index [:inspector_id, :mosquito_trap_id]
      # t.index [:mosquito_trap_id, :inspector_id]
    end
  end
end
