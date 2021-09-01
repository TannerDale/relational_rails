require 'rails_helper'

RSpec.describe VideoGame, type: :model do
  describe 'relationships' do
    it {should have_many :characters}
  end

  describe 'instance methods' do
    before :each do
      @game = VideoGame.create(name: 'Test', campaign_hours: 1, multiplayer: true)

      @char1 = Character.create(
        name: 'Yennefer',
        age: 107,
        human: true,
        video_game_id: @game.id
      )
      @char2 = Character.create(
        name: 'Geralt',
        age: 97,
        human: true,
        video_game_id: @game.id
      )
    end

    it 'has a character count' do
      allow_any_instance_of(VideoGame).to receive(:characters).and_return([1, 2])
      game = VideoGame.create(name: 'Test', campaign_hours: 1, multiplayer: true)

      expect(game.character_count).to eq(2)
    end

    it 'has characters ordered by name' do
      expect(@game.ordered_characters({})).to eq([@char1, @char2])
      expect(@game.ordered_characters({order: 'alpha'})).to eq([@char2, @char1])
    end
  end

  describe 'class methods' do
    before :each do
      @game = VideoGame.create(name: 'Test', campaign_hours: 1, multiplayer: true)
      @game2 = VideoGame.create(name: 'Alpha', campaign_hours: 1, multiplayer: true)

      @char1 = Character.create(
        name: 'Yennefer',
        age: 107,
        human: true,
        video_game_id: @game.id
      )
      @char2 = Character.create(
        name: 'Geralt',
        age: 97,
        human: true,
        video_game_id: @game.id
      )

      @char3 = Character.create(
        name: 'Test',
        age: 107,
        human: true,
        video_game_id: @game2.id
      )
      @char4 = Character.create(
        name: 'Testy',
        age: 97,
        human: true,
        video_game_id: @game2.id
      )
      @char5 = Character.create(
        name: 'Spice',
        age: 97,
        human: true,
        video_game_id: @game2.id
      )
    end

    it 'has games ordered created at' do
      expect(VideoGame.ordered_games.to_a).to eq([@game, @game2])
    end

    it 'has games ordered character count' do
      expect(VideoGame.ordered_character_count.to_a).to eq([@game2, @game])
    end
  end
end
