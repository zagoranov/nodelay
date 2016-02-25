class TaskSchedule < ActiveRecord::Migration
  def change
    add_column :users, :schedule_url, :string
    add_column :users, :schedules, :boolean, :default => false

    add_column :tasks, :schedulerid, :integer
  end
end
