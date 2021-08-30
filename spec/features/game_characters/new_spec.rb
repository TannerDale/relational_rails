require 'rails_helper'

describe 'characters new' do
  it 'has a form with required info' do
      game = VideoGame.create!(
      name: 'Witcher 3',
      campaign_hours: 11,
      multiplayer: false
    )

    visit "/video_games/#{game.id}/characters/new"

    fill_in 'name', with: 'Yennefer'
    fill_in 'age', with: 107
    check 'human'

    click_button 'Add Character'

    expect(page).to have_content("Witcher 3")
    expect(page).to have_content("Age: 107")
    expect(page).to have_content("Name: Yennefer")
    expect(page).to have_content("Human?: true")
  end
end
