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

    fill_in 'name', with: 'Witcher 11'
    fill_in 'campaign_hours', with: 512
    click_button 'Update Game'

    expect(page).to have_content("Witcher 11")
    expect(page).to have_content("Campaign hours: 512")
    expect(page).to have_content("Multiplayer?: false")
  end
end
