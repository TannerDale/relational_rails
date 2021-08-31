require 'rails_helper'

describe 'video games new' do
  it 'has a form with required info' do
    visit '/video_games/new'

    fill_in 'Name', with: 'Witcher 3'
    fill_in 'Campaign hours', with: 5
    check 'Multiplayer'

    click_button 'Create Video game'

    expect(current_path).to eq('/video_games')
    expect(page).to have_content("Witcher 3")
  end
end
