class OneTypeForImpAndTreat < ActiveRecord::Migration
  def change
    create_table :impulsetreattypes do |t|
      t.string :title
      t.text :description
      t.boolean :small, :default => true
      t.timestamps
    end
    add_column :treats, :impulsetreattype_id, :integer
    add_column :impulses, :impulsetreattype_id, :integer
  end
end
