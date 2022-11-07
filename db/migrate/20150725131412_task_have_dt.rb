class TaskHaveDt < ActiveRecord::Migration
  def change
    add_column :tasks, :dt, :datetime
  end
end
