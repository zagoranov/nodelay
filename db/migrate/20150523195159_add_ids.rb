class AddIds < ActiveRecord::Migration
  def change
    add_column :goals, :user_id, :integer
    add_column :impulses, :user_id, :integer
    add_column :treats, :impulse_id, :integer
  end
end
