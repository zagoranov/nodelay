class TaskSchedule2 < ActiveRecord::Migration
  def change
    remove_column :tasks, :schedulerid, :integer
    add_column :tasks, :schedulerid, :string
  end
end
