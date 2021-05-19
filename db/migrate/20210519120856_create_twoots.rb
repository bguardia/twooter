class CreateTwoots < ActiveRecord::Migration[6.1]
  def change
    create_table :twoots do |t|
      t.text :body

      t.timestamps
    end
  end
end
