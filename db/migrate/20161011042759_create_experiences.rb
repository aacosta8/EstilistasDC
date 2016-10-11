class CreateExperiences < ActiveRecord::Migration[5.0]
  def change
    create_table :experiences do |t|
      t.references :person, foreign_key: true
      t.string :comentario
      t.string :foto_exp

      t.timestamps
    end
  end
end
