class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.references :video_game, foreign_key: true
      t.string :name
      t.integer :age
      t.boolean :human

      t.timestamps
    end
  end
end
