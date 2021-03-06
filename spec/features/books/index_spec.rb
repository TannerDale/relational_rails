require 'rails_helper'

describe 'books index page' do
  before(:each) do
    @lib1 = Library.create!(
      name: 'Mesa Public Library',
      employees: 15,
      open_weekends: true
    )
    @book1 = Book.create!(
      library_id: @lib1.id,
      title: 'A Wizard of Earthsea',
      author_surname: 'Le Guin',
      nonfiction: false,
      year_published: 1968
    )
    @book2 = Book.create!(
      library_id: @lib1.id,
      title: 'Cosmos',
      author_surname: 'Sagan',
      nonfiction: true,
      year_published: 1980
    )

    visit '/books'
  end

  it 'has books and information, if nonfiction is true' do
    expect(page).to have_content('Books')
    expect(page).not_to have_content("Title: #{@book1.title}")
    expect(page).not_to have_content("Author: #{@book1.author_surname}")
    expect(page).not_to have_content("Nonfiction?: #{@book1.nonfiction}")
    expect(page).not_to have_content("Year Published: #{@book1.year_published}")
    expect(page).to have_content("Title: #{@book2.title}")
    expect(page).to have_content("Author: #{@book2.author_surname}")
    expect(page).to have_content("Nonfiction?: #{@book2.nonfiction}")
    expect(page).to have_content("Year Published: #{@book2.year_published}")
    expect(page).to have_content("Library: #{@book2.library.name}")
  end

  it 'has delete functionality' do
    click_on('Delete Book', match: :first)

    expect(page).to_not have_content('A Wizard of Earthsea')
  end
end
