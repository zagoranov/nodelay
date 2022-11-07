class Calendaity < ActiveRecord::Migration
  def change
    add_column :tasks, :calendarity, :boolean, :default => false
  end
end
