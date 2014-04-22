class AddImageToItems < ActiveRecord::Migration
  def change
    add_column :items, :itemimage, :string
  end
end
