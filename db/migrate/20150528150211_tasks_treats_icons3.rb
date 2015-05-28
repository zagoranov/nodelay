class TasksTreatsIcons3 < ActiveRecord::Migration
  def change
    remove_column :tasks, :icon

    add_column :tasks, :icon, :string, :default => "001"

  end
end
