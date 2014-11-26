class CreateTareas < ActiveRecord::Migration
  def change
    create_table :tareas do |t|
      t.string :titulo
      t.text :desc
      t.integer :horas
      t.date :fecha
      t.references :tipo, index: true
	  t.references :usuario, index: true

      t.timestamps
    end
  end
end
