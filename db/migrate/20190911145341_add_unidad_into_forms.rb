class AddUnidadIntoForms < ActiveRecord::Migration[5.2]
  def change
    add_column :forms, :unidad, :string
  end
end
