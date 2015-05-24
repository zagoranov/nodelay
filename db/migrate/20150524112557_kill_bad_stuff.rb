class KillBadStuff < ActiveRecord::Migration
  def change
        drop_table :impulsetypes
        drop_table :treattypes
	drop_table :goals

	remove_column :impulses, :impulsetype_id
	remove_column :treats, :treattype_id
  end
end
