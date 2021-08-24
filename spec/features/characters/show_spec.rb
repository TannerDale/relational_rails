require 'rails_helper'

describe 'characters show page' do
  it 'has attributes' do
    game = VideoGame.create!(
      name: 'Witcher 3',
      campaign_hours: 11,
      multiplayer: false
    )
    char = Character.create(
      name: 'Yennefer',
      age: 107,
      human: true,
      video_game_id: game.id
    )

    visit "/characters/#{char.id}"


    expect(page).to have_content(char.name)
    expect(page).to have_content("Age: #{char.age}")
    expect(page).to have_content("Human?: #{char.human}")
  end
end
