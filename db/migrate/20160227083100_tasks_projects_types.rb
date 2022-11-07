class TasksProjectsTypes < ActiveRecord::Migration
  def change
    create_table :projecttips do |t|
      t.text :name
    end

    create_table :tasktips do |t|
      t.text :name
    end

    add_column :tasks, :tasktip_id, :integer
    add_column :projects, :projecttip_id, :integer

    remove_column :tasks, :grade
    remove_column :projects, :tip


  end
end
