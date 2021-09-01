require 'rails_helper'

describe 'books show page' do
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

    visit "/books/#{@book1.id}"
  end

  it 'has attributes' do
    expect(page).to have_content(@book1.title)
    expect(page).to have_content("Author: #{@book1.author_surname}")
    expect(page).to have_content("Nonfiction?: #{@book1.nonfiction}")
    expect(page).to have_content("Year Published: #{@book1.year_published}")
    expect(page).to have_content("Library: #{@book1.library.name}")
  end

  it 'has delete functionality' do
    click_on('Delete Book', match: :first)

    expect(page).to_not have_content('A Wizard of Earthsea')
  end
end
