class DescriptionAgain < ActiveRecord::Migration
  def change
        remove_column :tasks, :description

        add_column :tasks, :description, :text
  end
end
