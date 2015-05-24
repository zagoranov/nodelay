class UserRandomChance2 < ActiveRecord::Migration
  def change
    remove_column :users, :randchance

    add_column :users, :randchance, :integer, :default => 4
  end
end
