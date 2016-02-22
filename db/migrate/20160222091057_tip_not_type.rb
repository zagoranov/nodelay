class TipNotType < ActiveRecord::Migration
  def change
    remove_column :projects, :type

    add_column :projects, :tip, :integer, :default => 1
  end
end
