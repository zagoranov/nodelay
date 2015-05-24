class TypesToUser < ActiveRecord::Migration
  def change
    add_column :impulsetreattypes, :user_id, :integer
  end
end
