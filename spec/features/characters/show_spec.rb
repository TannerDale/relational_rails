require 'rails_helper'

describe 'characters show page' do
  before :each do
    @game = VideoGame.create!(
      name: 'Witcher 3',
      campaign_hours: 11,
      multiplayer: false
    )
    @char = Character.create(
      name: 'Yennefer',
      age: 107,
      human: true,
      video_game_id: @game.id
    )
  end

  it 'has attributes' do
    visit "/characters/#{@char.id}"

    expect(page).to have_content(@char.name)
    expect(page).to have_content("Age: #{@char.age}")
    expect(page).to have_content("Human?: #{@char.human}")
  end

  it 'can delete a character' do
    visit "/characters/#{@char.id}"

    expect(page).to have_content('Delete Character')

    click_on 'Delete Character'

    expect(Character.all.length).to eq(0)
  end
end
