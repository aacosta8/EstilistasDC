class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.date :fecha
      t.time :hora_inicio
      t.time :hora_fin
      t.references :stylist, foreign_key: true

      t.timestamps
    end
  end
end
