class CreateLibraries < ActiveRecord::Migration[5.2]
  def change
    create_table :libraries do |t|
      t.string :name
      t.integer :employees
      t.boolean :open_weekends

      t.timestamps
    end
  end
end
