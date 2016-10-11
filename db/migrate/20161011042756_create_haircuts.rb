class CreateHaircuts < ActiveRecord::Migration[5.0]
  def change
    create_table :haircuts do |t|
      t.string :nombre_corte
      t.string :descripcion
      t.string :foto

      t.timestamps
    end
  end
end
