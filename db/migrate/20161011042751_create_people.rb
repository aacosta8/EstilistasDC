class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :cedula
      t.string :nombre
      t.string :apellido
      t.date :fecha_nacimiento
      t.boolean :genero
      t.string :telefono_movil
      t.string :telefono_fijo
      t.references :ubication, foreign_key: true
      t.attachment :foto_perfil
      t.string :tipo

      t.timestamps
    end
  end
end
