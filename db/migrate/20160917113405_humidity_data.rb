class HumidityData < ActiveRecord::Migration
  def change

    create_table :enviros do |t|
      t.integer :humidity
      t.integer :temperature
      t.datetime :dt
    end


  end
end
