class ProjectDone < ActiveRecord::Migration
  def change

    add_column :projects, :done, :boolean, :default => false

    add_column :projects, :donedt, :datetime

  end
end
