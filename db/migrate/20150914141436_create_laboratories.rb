class CreateLaboratories < ActiveRecord::Migration
  def change
    create_table(:laboratories, id: :uuid) do |t|

      t.uuid     :patient_id,   null: false
      t.datetime :fecha
      t.float    :hb
      t.float    :htc
      t.string   :vdrl
      t.float    :glicemia
      t.string   :orina
      t.string   :heces

      t.timestamps null: false
    end

    add_index :laboratories, :patient_id
  end
end