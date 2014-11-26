class CreatePerfils < ActiveRecord::Migration
  def change
    create_table :perfils do |t|
      t.string :nombre
      t.text :desc
      t.timestamps
    end
  end
end
