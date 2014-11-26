class AddPasswordDigestToUsuarios < ActiveRecord::Migration
  
  def up
    remove_column "usuarios", "password_hash"
	remove_column "usuarios", "password_salt"
    add_column "usuarios", "password_digest", :string
  end
  
  def down
    add_column "usuarios", "hashed_password", :string, :limit => 40
    remove_column "usuarios", "password_digest"
  end
  
end
