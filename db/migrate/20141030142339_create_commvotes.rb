class CreateCommvotes < ActiveRecord::Migration
  def change
    create_table :commvotes do |t|
      t.integer :user_id
      t.integer :comment_id
      t.integer :grade
      t.timestamps
    end
  end
end
