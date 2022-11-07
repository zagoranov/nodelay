class GoalsTasksImpulsesTreats < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :title
      t.text :description
      t.timestamps
    end
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.boolean :done, :default => false
      t.integer :grade
      t.timestamps
    end
    create_table :impulses do |t|
      t.integer :impulsetype_id
      t.text :description
      t.timestamps
    end
    create_table :impulsetypes do |t|
      t.string :title
      t.text :description
      t.timestamps
    end
    create_table :treats do |t|
      t.integer :treattype_id
      t.boolean :done, :default => false
      t.timestamps
    end
    create_table :treattypes do |t|
      t.string :title
      t.text :description
      t.integer :type
      t.integer :grade
      t.timestamps
    end
  end
end
