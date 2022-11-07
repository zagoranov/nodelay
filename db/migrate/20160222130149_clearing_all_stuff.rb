class ClearingAllStuff < ActiveRecord::Migration
  def change

        drop_table :treats
        drop_table :impulsetreattypes
        drop_table :impulses

        remove_column :tasks, :title
        remove_column :tasks, :description
        remove_column :tasks, :user_id
        remove_column :tasks, :icon
        remove_column :tasks, :longbox

  end
end
