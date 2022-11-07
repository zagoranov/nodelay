class UrlForType < ActiveRecord::Migration
  def change
    add_column :impulsetreattypes, :url, :string
  end
end
