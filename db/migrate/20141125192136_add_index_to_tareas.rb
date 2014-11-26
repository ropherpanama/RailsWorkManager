class AddIndexToTareas < ActiveRecord::Migration
  def change
    add_index(:tareas, :titulo)
  end
end
