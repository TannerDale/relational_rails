class CreateVideoGames < ActiveRecord::Migration[5.2]
  def change
    create_table :video_games do |t|
      t.string :name
      t.integer :campaign_hours
      t.boolean :multiplayer

      t.timestamps
    end
  end
end
