require 'rails_helper'

describe 'video games edit' do
  it 'has a form to edit and update its info ' do
    game = VideoGame.create!(
      name: 'Witcher 3',
      campaign_hours: 11,
      multiplayer: false
    )

    visit "/video_games/#{game.id}/edit"

    expect(page).to have_content('Edit Witcher 3')
    fill_in 'Name', with: 'Witcher 11'
    fill_in 'Campaign hours', with: 512
    click_button 'Update Video game'

    expect(page).to have_content("Witcher 11")
    expect(page).to have_content("Campaign hours: 512")
    expect(page).to have_content("Multiplayer?: false")
  end
end
