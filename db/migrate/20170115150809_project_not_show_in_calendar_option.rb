class ProjectNotShowInCalendarOption < ActiveRecord::Migration
  def change
    add_column :projects, :hideincalend, :boolean, :default => false
  end
end
