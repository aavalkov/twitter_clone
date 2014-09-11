class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.column :message, :string
      t.column :user_id, :int
    end
  end
end
