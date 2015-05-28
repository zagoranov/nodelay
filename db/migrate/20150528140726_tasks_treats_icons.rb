class TasksTreatsIcons < ActiveRecord::Migration
  def change
    add_column :treats, :icon, :integer, :default => 0
    add_column :tasks, :icon, :integer, :default => 0
  end
end
