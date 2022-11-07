class TasksActuality < ActiveRecord::Migration
  def change
    add_column :tasks, :actual, :boolean, :default => true
  end
end
