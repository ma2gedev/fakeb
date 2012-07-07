class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :null => false
      t.string :password_digest, :null => false
      t.string :auto_login_token

      t.timestamps
    end
  end
end
