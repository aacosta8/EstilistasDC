class CreateHaircutStylists < ActiveRecord::Migration[5.0]
  def change
    create_table :haircut_stylists do |t|
      t.references :stylist, foreign_key: true
      t.references :haircut, foreign_key: true

      t.timestamps
    end
  end
end
