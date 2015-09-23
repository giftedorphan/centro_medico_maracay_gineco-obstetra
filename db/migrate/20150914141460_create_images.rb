class CreateImages < ActiveRecord::Migration
  def change
    create_table(:images, id: :uuid) do |t|

      t.uuid :pregnancy_id, null: false
      t.datetime :fecha
      t.string :imagen
      t.text :descripcion

      t.timestamps null: false
    end

    add_index :images, :pregnancy_id
  end
end