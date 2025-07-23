class AddSpecialtyToInspectors < ActiveRecord::Migration[8.0]
  def change
    add_column :inspectors, :specialty, :string
  end
end
