class TasksTreatsIcons2 < ActiveRecord::Migration
  def change
    remove_column :treats, :icon
    remove_column :tasks, :icon

    add_column :treats, :icon, :string, :default => "01"
    add_column :tasks, :icon, :string, :default => "01"

  end
end
