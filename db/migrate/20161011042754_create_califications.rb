class CreateCalifications < ActiveRecord::Migration[5.0]
  def change
    create_table :califications do |t|
      t.references :stylist, foreign_key: true
      t.references :customer, foreign_key: true
      t.integer :calificacion

      t.timestamps
    end
  end
end
