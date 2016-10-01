class HumidityUser < ActiveRecord::Migration
  def change
    add_column :enviros, :user_id, :integer
  end
end
