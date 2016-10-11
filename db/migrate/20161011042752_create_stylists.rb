class CreateStylists < ActiveRecord::Migration[5.0]
  def change
    create_table :stylists do |t|
      t.references :person, foreign_key: true
      t.string :especialidad
      t.string :correo_electronico

      t.timestamps
    end
  end
end
