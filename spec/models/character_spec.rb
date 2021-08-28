require 'rails_helper'

RSpec.describe Character, type: :model do
  describe 'relationships' do
    it {should belong_to :video_game}
  end

  before :each do
    @game = VideoGame.create!(
      name: 'Witcher 3',
      campaign_hours: 11,
      multiplayer: false
    )
    @char1 = Character.create(
      name: 'Yennefer',
      age: 107,
      human: true,
      video_game_id: @game.id
    )
    @char2 = Character.create(
      name: 'Zoltan',
      age: 67,
      human: false,
      video_game_id: @game.id
    )
  end

  describe 'filtering' do
    it '#only_humans' do
      expect(Character.all.only_humans).to eq([@char1])
    end

    it 'has over certain age' do
      expect(Character.all.over_age(100)).to eq([@char1])
    end

    it 'can search exact matching record name' do
      expect(Character.exact_search('Yennefer')).to eq([@char1])
    end

    it 'can search loose matching record name' do
      expect(Character.loose_search('Zol')).to eq([@char2])
    end
  end
end
