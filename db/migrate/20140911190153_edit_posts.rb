class EditPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :message, :string
    rename_table :posts, :tweets
    add_column :tweets, :tweet, :string
  end
end
