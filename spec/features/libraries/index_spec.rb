require 'rails_helper'

describe 'libraries index page' do
  before(:each) do
    @lib1 = Library.create!(
      name: 'Mesa Public Library',
      employees: 15,
      open_weekends: true
    )
    @lib2 = Library.create!(
      name: 'Maricopa Public Library',
      employees: 9,
      open_weekends: false
    )

    visit '/libraries'
  end

  it 'shows all library names' do

    expect(page).to have_content(@lib1.name)
    expect(page).to have_content(@lib1.created_at)

    expect(page).to have_content(@lib2.name)
    expect(page).to have_content(@lib2.created_at)
  end

  it 'has link to create new lib' do
    expect(page).to have_content('New Library')
    expect(page).to have_selector(:css, "a[href='/libraries/new']")
  end

  it 'has delete functionality' do
    click_on('Delete Library', match: :first)

    expect(page).to_not have_content('Maricopa Public Library')
  end
end
