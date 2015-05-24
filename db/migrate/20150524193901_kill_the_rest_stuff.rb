class KillTheRestStuff < ActiveRecord::Migration
  def change

     drop_table :comments
     drop_table :commvotes
     drop_table :messages
     drop_table :posts
     drop_table :votes

  end
end

