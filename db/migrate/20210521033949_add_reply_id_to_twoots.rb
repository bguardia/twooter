class AddReplyIdToTwoots < ActiveRecord::Migration[6.1]
  def change
    add_column :twoots, :reply_id, :bigint
  end
end
