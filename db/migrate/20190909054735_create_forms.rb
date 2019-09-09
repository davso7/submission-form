class CreateForms < ActiveRecord::Migration[5.2]
  def change
    create_table :forms do |t|
      t.string :nombre
      t.string :apellidos
      t.integer :cedula
      t.string :email
      t.integer :telefono
      t.string :institucion
      t.string :cargo
      t.string :profesion
      t.integer :user_id

      t.timestamps
    end
  end
end
