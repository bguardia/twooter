class AddUserIdToTwoots < ActiveRecord::Migration[6.1]
  def change
    add_column :twoots, :user_id, :integer
  end
end
