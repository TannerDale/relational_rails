require 'rails_helper'

describe 'video games index page' do
  before :each do
    @game = VideoGame.create!(
      name: 'Witcher 3',
      campaign_hours: 11,
      multiplayer: false
    )
    visit '/video_games'
  end

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
    expect(page).to have_content('Characters')
    expect(page).to have_selector(:css, "a[href='/video_games/#{@game.id}/characters']")
  end

  it 'can have a link to edit video game' do
    expect(page).to have_content('Edit Game')
    expect(page).to have_selector(:css, "a[href='/video_games/#{@game.id}/edit']")
  end

  it 'can delete a game' do
    click_on 'Delete Game'

    expect(VideoGame.all.length).to eq(0)
  end

  it 'has game ordered by character count' do
    game2 = VideoGame.create!(
      name: 'Zar Cry 5',
      campaign_hours: 2,
      multiplayer: true
    )
    char1 = Character.create!(
      name: 'Yennefer',
      age: 107,
      human: true,
      video_game_id: @game.id
    )
    char2 = Character.create!(
      name: 'Jospeph',
      age: 42,
      human: false,
      video_game_id: game2.id
    )
    char3 = Character.create!(
      name: 'Hope',
      age: 23,
      human: false,
      video_game_id: game2.id
    )

    visit '/video_games'

    expect(@game.name).to appear_before(game2.name)

    click_on 'Order by Character Count'

    expect(game2.name).to appear_before(@game.name)
  end
end
