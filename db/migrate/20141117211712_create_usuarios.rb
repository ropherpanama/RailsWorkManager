class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :nombre
      t.string :apellido
      t.string :password_hash
      t.string :password_salt
      t.string :nickname
	  t.references :perfil, index: true
      t.timestamps
    end
  end
end
