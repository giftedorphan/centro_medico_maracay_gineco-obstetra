class CreateBackgrounds < ActiveRecord::Migration
  def change
    create_table(:backgrounds, id: :uuid) do |t|

      t.uuid    :patient_id,               null: false
      t.integer :menarquia
      t.string  :reglas
      t.string  :gesta
      t.string  :paridad
      t.string  :vivos
      t.string  :muertos
      t.string  :abortos
      t.string  :mola
      t.string  :foceps
      t.string  :cesareas
      t.string  :gemelares
      t.string  :podalicos
      t.string  :prematuros
      t.string  :pmf
      t.text    :otros
      t.string  :grupo_sangre_embarazada
      t.string  :rh_embarazada
      t.string  :grupo_sangre_esposo
      t.string  :rh_esposo
      t.text    :toxoplasmosis
      t.boolean :sensibilizacion


      t.timestamps null: false
    end

    add_index :backgrounds, :patient_id,      unique: true
  end
end