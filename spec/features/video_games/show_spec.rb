require 'rails_helper'

describe 'video games show page' do
  it 'has game attributes' do
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
      name: 'Geralt',
      age: 97,
      human: true,
      video_game_id: game.id
    )

    visit "/video_games/#{game.id}"

    expect(page).to have_selector(:css, "a[href='/video_games/#{game.id}/characters']")

    expect(page).to have_content(game.name)
    expect(page).to have_content("Campaign hours: #{game.campaign_hours}")
    expect(page).to have_content("Multiplayer?: #{game.multiplayer}")
  end

  it 'has character info' do
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
      name: 'Geralt',
      age: 97,
      human: true,
      video_game_id: game.id
    )

    visit "/video_games/#{game.id}"

    expect(page).to have_content("Characters: 2")
  end
end
