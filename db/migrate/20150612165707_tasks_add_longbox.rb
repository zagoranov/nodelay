class TasksAddLongbox < ActiveRecord::Migration
  def change
    add_column :tasks, :longbox, :boolean, :default => false
  end
end
