class CreateLikesTable < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.belongs_to :twoot
      t.belongs_to :user
    end
  end
end
