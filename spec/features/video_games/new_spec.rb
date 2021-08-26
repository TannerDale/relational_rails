require 'rails_helper'

describe 'video games new' do
  it 'has a form with required info' do
    visit '/video_games/new'

    fill_in 'name', with: 'Witcher 3'
    fill_in 'campaign_hours', with: 5
    check 'multiplayer'

    click_button 'Add Game'

    expect(current_path).to eq('/video_games')
    expect(page).to have_content("Witcher 3")
  end
end
