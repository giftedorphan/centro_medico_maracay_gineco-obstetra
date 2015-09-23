class CreatePatients < ActiveRecord::Migration
  def change
    create_table(:patients, id: :uuid) do |t|

      t.string   :nombre,          null: false
      t.string   :apellido,        null: false
      t.integer  :edad,            null: false
      t.text     :direccion,       null: false
      t.string   :cedula, null: false
      t.string   :avatar

      t.timestamps null: false
    end

    add_index :patients, :cedula,      unique: true
  end
end