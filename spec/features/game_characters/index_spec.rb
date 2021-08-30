require 'rails_helper'

describe 'video game characters' do
  before :each do
    @game = VideoGame.create(name: 'Test', campaign_hours: 1, multiplayer: true)
    @char1 = Character.create(
      name: 'Yennefer',
      age: 107,
      human: true,
      video_game_id: @game.id
    )
    @char2 = Character.create(
      name: 'Geralt',
      age: 97,
      human: true,
      video_game_id: @game.id
    )

    visit "/video_games/#{@game.id}/characters"
  end

  it 'has the games characters and their info' do
    expect(page).to have_content("#{@game.name} Characters")
    expect(page).to have_content('Characters')
    expect(page).to have_content("Name: #{@char1.name}")
    expect(page).to have_content("Age: #{@char1.age}")
    expect(page).to have_content("Human?: #{@char1.human}")
    expect(page).to have_content("Name: #{@char2.name}")
    expect(page).to have_content("Age: #{@char2.age}")
    expect(page).to have_content("Human?: #{@char2.human}")

    expect("Name: #{@char1.name}").to appear_before("Name: #{@char2.name}", only_text: true)

    click_on 'Sort Alphabetically'

    expect("Name: #{@char2.name}").to appear_before("Name: #{@char1.name}", only_text: true)

    expect(page).to have_content('New Character')
    expect(page).to have_selector(:css, "a[href='/video_games/#{@game.id}/characters/new']")
  end

  it 'has a link to edit the characters' do
    [@char1, @char2].each do |char|
      expect(page).to have_selector(:css, "a[href='/video_games/#{@game.id}/characters/#{@char1.id}/edit']")
    end

    click_on "Edit #{@char1.name}"

    expect(current_path).to eq("/video_games/#{@game.id}/characters/#{@char1.id}/edit")
  end

  it 'has a form to select a threshhold for the character age' do
    fill_in 'minimum_age', with: 100

    click_button 'Apply Filter'

    expect(page).to have_content('Yennefer')
    expect(page).not_to have_content('Geralt')
  end

  it 'has a link to delete the characters' do
    click_on "Delete #{@char2.name}"

    expect(current_path).to eq('/characters')
    expect(Character.all.length).to eq(1)
  end
end
