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
  end
end
