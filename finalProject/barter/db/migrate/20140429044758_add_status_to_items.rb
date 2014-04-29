class AddStatusToItems < ActiveRecord::Migration
  def change
  	 add_column :items, :isavailable, :boolean, default: true
  end
end
