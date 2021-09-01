require 'rails_helper'

describe 'edit book' do
  it 'has update functionality' do
    lib1 = Library.create!(
      name: 'Mesa Public Library',
      employees: 15,
      open_weekends: true
    )
    book1 = Book.create!(
      library_id: lib1.id,
      title: "A Wizard of Earthsea",
      author_surname: "Le Guin",
      nonfiction: false,
      year_published: 1968
    )

    visit "/books/#{book1.id}/edit"

    fill_in 'title', with: 'aWoE'
    fill_in 'author_surname', with: 'LeGuin'
    check 'nonfiction'
    fill_in 'year_published', with: '68'

    click_button 'Update Book'

    expect(page).to have_content('aWoE')
    expect(page).to have_content('Author: LeGuin')
    expect(page).to have_content('Nonfiction?: true')
    expect(page).to have_content('Year Published: 68')
  end
end
