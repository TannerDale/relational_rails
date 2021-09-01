require 'rails_helper'

describe 'library books' do
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
    @book3 = Book.create!(
      library_id: @lib1.id,
      title: 'Baseball',
      author_surname: 'Author',
      nonfiction: true,
      year_published: 1999
    )

    visit "/libraries/#{@lib1.id}/books"
  end

  it 'has books and info' do
    expect(page).to have_content("#{@lib1.name} Books")
    expect(page).to have_content("Title: #{@book1.title}")
    expect(page).to have_content("Author: #{@book1.author_surname}")
    expect(page).to have_content("Nonfiction?: #{@book1.nonfiction}")
    expect(page).to have_content("Year Published: #{@book1.year_published}")
    expect(page).to have_content("Title: #{@book2.title}")
    expect(page).to have_content("Author: #{@book2.author_surname}")
    expect(page).to have_content("Nonfiction?: #{@book2.nonfiction}")
    expect(page).to have_content("Year Published: #{@book2.year_published}")
  end

  it 'has create new book functionality' do
    expect(page).to have_content('New Book')
    expect(page).to have_selector(:css, "a[href='/libraries/#{@lib1.id}/books/new']")
  end

  it 'has delete functionality' do
    click_on('Delete Book', match: :first)

    expect(page).to_not have_content('A Wizard of Earthsea')
  end

  it 'has alphabetize functionality' do
    click_on 'Sort Alphabetically by Title'

    expect('A Wizard of Earthsea').to appear_before('Baseball')
    expect('Baseball').to appear_before('Cosmos')
  end

  it 'has publishing year filtering functionality' do
    fill_in 'earliest_year_published', with: 1982

    click_button 'Apply'

    expect(page).to have_content('Baseball')
    expect(page).not_to have_content('Cosmos')
    expect(page).not_to have_content('A Wizard of Earthsea')
  end
end
