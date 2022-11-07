class ClearingAllStuff3 < ActiveRecord::Migration
  def change
        drop_table :users_tags

	create_table :tags_users, id: false do |t|
          t.belongs_to :tag, index: true
          t.belongs_to :user, index: true
        end
  end
end
