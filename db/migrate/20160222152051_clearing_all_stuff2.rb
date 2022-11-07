class ClearingAllStuff2 < ActiveRecord::Migration
  def change
        remove_column :users, :randchance
        remove_column :users, :score

        change_column_default :tasks, :grade, 3


	create_table :users_tags, id: false do |t|
          t.belongs_to :user, index: true
          t.belongs_to :tag, index: true
        end

  end
end
