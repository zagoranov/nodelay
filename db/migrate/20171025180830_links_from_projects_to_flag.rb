class LinksFromProjectsToFlag < ActiveRecord::Migration
  def change
	add_column :tasks, :itislink, :boolean, :default => false
  end
end
