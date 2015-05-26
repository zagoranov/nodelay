class ErsasedFlag4Ttype < ActiveRecord::Migration
  def change
    add_column :impulsetreattypes, :erased, :boolean, :default => false
  end
end
