class EditTweets < ActiveRecord::Migration
  def change
    drop_table :tweets

    create_table :tweets do |t|
      t.column :user_id, :integer
      t.column :tweet, :string

      t.timestamps
    end
  end
end
