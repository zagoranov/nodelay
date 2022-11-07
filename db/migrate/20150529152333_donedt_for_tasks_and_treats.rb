class DonedtForTasksAndTreats < ActiveRecord::Migration
  def change

    add_column :tasks, :donedt, :datetime
    add_column :treats, :donedt, :datetime

  end
end
