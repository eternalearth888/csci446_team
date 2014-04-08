class AddUsernameAndIsadminToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.rename :email, :username
      t.boolean :isadmin      
    end
  end
end
