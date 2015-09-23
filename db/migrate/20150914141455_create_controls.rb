class CreateControls < ActiveRecord::Migration
  def change
    create_table(:controls, id: :uuid) do |t|

      t.uuid :pregnancy_id, null: false
      t.datetime :fecha
      t.string :eg
      t.float :au
      t.float :ta
      t.float :peso
      t.string :present
      t.integer :ff
      t.string :edemas

      t.timestamps null: false
    end

    add_index :controls, :pregnancy_id
  end
end