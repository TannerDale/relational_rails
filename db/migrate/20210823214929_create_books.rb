class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.references :library, foreign_key: true
      t.string :title
      t.string :author_surname
      t.boolean :nonfiction
      t.integer :year_published

      t.timestamps
    end
  end
end
