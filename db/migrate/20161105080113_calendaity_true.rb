class CalendaityTrue < ActiveRecord::Migration
  def change
	change_column_default :tasks, :calendarity, true
  end
end
