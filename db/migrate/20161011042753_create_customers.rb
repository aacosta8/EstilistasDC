class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.references :person, foreign_key: true
      t.string :tipo_discapacidad

      t.timestamps
    end
  end
end
