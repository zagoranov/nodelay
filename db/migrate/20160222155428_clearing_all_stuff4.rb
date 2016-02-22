class ClearingAllStuff4 < ActiveRecord::Migration
  def change
        drop_table :tags_users

	create_table :tags_tasks, id: false do |t|
          t.belongs_to :tag, index: true
          t.belongs_to :task, index: true
        end
  end
end
