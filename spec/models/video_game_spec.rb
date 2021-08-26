require 'rails_helper'

RSpec.describe VideoGame, type: :model do
  describe 'relationships' do
    it {should have_many :characters}
  end

  describe 'instance methods' do
    it 'has a character count' do
      allow_any_instance_of(VideoGame).to receive(:characters).and_return([1, 2])
      game = VideoGame.create(name: 'Test', campaign_hours: 1, multiplayer: true)

      expect(game.character_count).to eq(2)
    end

    it 'has characters ordered by name' do
      game = VideoGame.create(name: 'Test', campaign_hours: 1, multiplayer: true)

      char1 = Character.create(
        name: 'Yennefer',
        age: 107,
        human: true,
        video_game_id: game.id
      )
      char2 = Character.create(
        name: 'Geralt',
        age: 97,
        human: true,
        video_game_id: game.id
      )

      expect(game.ordered_characters({order: nil})).to eq([char1, char2])
      expect(game.ordered_characters({order: 'alpha'})).to eq([char2, char1])
    end
  end
end
