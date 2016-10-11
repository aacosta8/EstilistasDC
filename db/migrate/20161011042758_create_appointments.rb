class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.date :fecha
      t.time :hora_inicio
      t.integer :estado
      t.references :stylist, foreign_key: true
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
