class CreateFollows < ActiveRecord::Migration[6.1]
  def change
    create_table :follows do |t|
      t.integer :follower_id
      t.integer :followed_id
      t.foreign_key :users, column: :follower_id
      t.foreign_key :users, column: :followed_id
    end
  end
end
