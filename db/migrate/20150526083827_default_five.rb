class DefaultFive < ActiveRecord::Migration
  def change
    change_column_default :tasks, :grade, 5
  end
end
