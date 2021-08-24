require 'rails_helper'

describe 'characters index page' do
  it 'has all of the characters listed' do
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
    char3 = Character.create(
        name: 'Zoltan',
        age: 67,
        human: false,
        video_game_id: game.id
      )

    visit '/characters'

    expect(page).to have_content('Characters')
    expect(page).to have_content("Name: #{char1.name}")
    expect(page).to have_content("Game: #{char1.video_game.name}")
    expect(page).to have_content("Age: #{char1.age}")
    expect(page).to have_content("Human?: #{char1.human}")
    expect(page).to have_content("Name: #{char2.name}")
    expect(page).to have_content("Game: #{char2.video_game.name}")
    expect(page).to have_content("Age: #{char2.age}")
    expect(page).to have_content("Human?: #{char2.human}")
    expect(page).not_to have_content("Name: #{char3.name}")
    expect(page).not_to have_content("Age: #{char3.age}")
    expect(page).not_to have_content("Human?: #{char3.human}")
  end
end
