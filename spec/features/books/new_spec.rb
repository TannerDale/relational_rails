require 'rails_helper'

describe 'new book' do
  it 'has a form for new book' do
    lib1 = Library.create!(
      name: 'Mesa Public Library',
      employees: 15,
      open_weekends: true
    )

    visit "/libraries/#{lib1.id}/books/new"

    fill_in 'title', with: 'Dune'
    fill_in 'author_surname', with: 'Herbert'
    fill_in 'year_published', with: '1965'

    click_button 'Add Book'

    expect(page).to have_content('Title: Dune')
    expect(page).to have_content('Author: Herbert')
    expect(page).to have_content('Nonfiction?: false')
    expect(page).to have_content('Year Published: 1965')
  end
end
