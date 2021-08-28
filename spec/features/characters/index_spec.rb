require 'rails_helper'

describe 'characters index page' do
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
    @char3 = Character.create(
        name: 'Zoltan',
        age: 67,
        human: false,
        video_game_id: @game.id
      )

    visit '/characters'
  end

  it 'has all of the characters listed' do
    [@char1, @char2].each do |char|
      expect(page).to have_content('Characters')
      expect(page).to have_content("Name: #{char.name}")
      expect(page).to have_content("Game: #{char.video_game.name}")
      expect(page).to have_content("Age: #{char.age}")
      expect(page).to have_content("Human?: #{char.human}")
      expect(page).to have_content('Edit Character')
      expect(page).to have_selector(:css, "a[href='/characters/#{char.id}/edit']")
    end

    expect(page).not_to have_content("Name: #{@char3.name}")
    expect(page).not_to have_content("Age: #{@char3.age}")
    expect(page).not_to have_content("Human?: #{@char3.human}")
  end

  it 'can has a link to delete a character' do
    click_on "Delete #{@char2.name}"

    expect(current_path).to eq('/characters')
    expect(Character.all.length).to eq(2)
  end

  it 'can search for exact characters' do
    fill_in 'exact_name', with: 'Yennefer'
    click_button 'Find Character'

    expect(page).to have_content("Name: Yennefer")
    expect(page).not_to have_content("Name: Geralt")
  end

  it 'can search for loose characters' do
    fill_in 'loose_name', with: 'ger'
    click_button 'Loose Search Character'

    expect(page).to have_content("Name: Geralt")
    expect(page).not_to have_content("Name: Yennefer")

    fill_in 'loose_name', with: 'YenNeF'
    click_button 'Loose Search Character'

    expect(page).to have_content("Name: Yennefer")
    expect(page).not_to have_content("Name: Geralt")
  end
end
