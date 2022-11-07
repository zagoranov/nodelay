class UserRandomChance < ActiveRecord::Migration
  def change
    add_column :users, :randchance, :integer
  end
end
