class StartMigration < ActiveRecord::Migration
  def change

    add_column :tasks, :project_id, :integer   
    add_column :tasks, :object, :string
    add_column :tasks, :action, :string

    create_table :projects do |t|
      t.integer  :user_id
      t.string :name
      t.text :description
      t.datetime :lastmove
      t.integer :type, :default => 1
      t.timestamps
    end

    create_table :tags do |t|
      t.integer  :user_id
      t.string :name
    end

  create_table :tasks_tags do |t|
    t.integer  :task_id
    t.integer  :tag_id
  end



  end
end

