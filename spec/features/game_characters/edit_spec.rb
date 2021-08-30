require 'rails_helper'

describe 'character update' do
  it 'has a form to update info' do
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

    visit "/video_games/#{game.id}/characters/#{char.id}/edit"

    fill_in 'name', with: 'Yen'
    fill_in 'age', with: 28
    check 'human'

    click_button 'Update Character'

    expect(page).to have_content('Yen')
    expect(page).to have_content('Age: 28')
    expect(page).to have_content("Human?: true")
  end
end
