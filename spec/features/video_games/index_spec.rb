require 'rails_helper'

describe 'video games index page' do
  it 'can see all the video game names' do
    game1 = VideoGame.create!(
      name: 'Witcher 3',
      campaign_hours: 11,
      multiplayer: false
    )
    game2 = VideoGame.create!(
      name: 'Far Cry 5',
      campaign_hours: 2,
      multiplayer: true
    )

    visit '/video_games'

    expect(page).to have_content(game1.name)
    expect(page).to have_content(game1.created_at)

    expect(page).to have_content(game2.name)
    expect(page).to have_content(game2.created_at)
  end

  it 'can have a link to new video game' do
    visit '/video_games'

    expect(page).to have_content('Add Game')
    expect(page).to have_selector(:css, "a[href='/video_games/new']")
  end

  it 'can have a link to show the game characters' do
    game = VideoGame.create!(
      name: 'Witcher 3',
      campaign_hours: 11,
      multiplayer: false
    )
    visit '/video_games'

    expect(page).to have_content('Characters')
    expect(page).to have_selector(:css, "a[href='/video_games/#{game.id}/characters']")
  end

  it 'can have a link to edit video game' do
    game = VideoGame.create!(
      name: 'Witcher 3',
      campaign_hours: 11,
      multiplayer: false
    )
    visit '/video_games'

    expect(page).to have_content('Edit Game')
    expect(page).to have_selector(:css, "a[href='/video_games/#{game.id}/edit']")
  end
end
