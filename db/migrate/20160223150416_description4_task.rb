class Description4Task < ActiveRecord::Migration
  def change
        change_column_default :tasks, :grade, 1

        add_column :tasks, :description, :text
  end
end
