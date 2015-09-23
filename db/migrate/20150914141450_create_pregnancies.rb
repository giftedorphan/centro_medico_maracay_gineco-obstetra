class CreatePregnancies < ActiveRecord::Migration
  def change
    create_table(:pregnancies, id: :uuid) do |t|

      t.uuid :patient_id, null: false
      t.boolean :status,  null: false
      t.datetime :fur
      t.datetime :fpp

      t.timestamps null: false
    end

    add_index :pregnancies, :patient_id
  end
end