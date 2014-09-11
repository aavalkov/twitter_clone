class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.column :username, :string
      t.column :email, :string
      t.column :password_digest, :string
    end
  end
end
