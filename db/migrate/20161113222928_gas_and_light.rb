class GasAndLight < ActiveRecord::Migration
  def change

    add_column :enviros, :co2, :integer
    add_column :enviros, :light, :integer

  end
end
