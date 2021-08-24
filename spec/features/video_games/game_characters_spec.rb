require 'rails_helper'

describe 'video game characters' do
  it 'has the games characters and their info' do
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

    visit "/video_games/#{game.id}/characters"

    expect(page).to have_content("#{game.name} Characters")
    expect(page).to have_content('Characters')
    expect(page).to have_content("Name: #{char1.name}")
    expect(page).to have_content("Age: #{char1.age}")
    expect(page).to have_content("Human?: #{char1.human}")
    expect(page).to have_content("Name: #{char2.name}")
    expect(page).to have_content("Age: #{char2.age}")
    expect(page).to have_content("Human?: #{char2.human}")

    click_on 'Sort Alphabetically'

    expect("Name: #{char2.name}").to appear_before("Name: #{char1.name}")
  end
end
