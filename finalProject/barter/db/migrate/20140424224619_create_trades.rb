class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.integer :user1
      t.integer :user2
      t.integer :user1_item
      t.integer :user2_item
      t.integer :status
      t.text :description

      t.timestamps
    end
  end
end
