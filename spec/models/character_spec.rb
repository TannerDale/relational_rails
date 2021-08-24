require 'rails_helper'

RSpec.describe Character, type: :model do
  describe 'relationships' do
    it {should belong_to :video_game}
  end

  describe 'only truthy value' do
    it '#only_humans' do
      game = VideoGame.create!(
        name: 'Witcher 3',
        campaign_hours: 11,
        multiplayer: false
      )
      char1 = Character.create(
        name: 'Yennefer',
        age: 107,
        human: true,
        video_game_id: game.id
      )
      char2 = Character.create(
        name: 'Zoltan',
        age: 67,
        human: false,
        video_game_id: game.id
      )

      expect(Character.only_humans).to eq([char1])
    end
  end
end
