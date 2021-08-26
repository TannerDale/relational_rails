require 'rails_helper'

describe 'libraries show page' do
  it 'shows attributes' do
    library = Library.create!(
      name: 'Mesa Public Library',
      employees: 15,
      open_weekends: true
    )

    visit "/libraries/#{library.id}"

    expect(page).to have_content(library.name)
    expect(page).to have_content("Employees: #{library.employees}")
    expect(page).to have_content("Open Weekends?: #{library.open_weekends}")
  end

  it 'shows book count' do
    lib1 = Library.create!(
      name: 'Mesa Public Library',
      employees: 15,
      open_weekends: true
    )
    book1 = Book.create!(
      library_id: lib1.id,
      title: 'A Wizard of Earthsea',
      author_surname: 'Le Guin',
      nonfiction: false,
      year_published: 1968
    )
    book2 = Book.create!(
      library_id: lib1.id,
      title: 'Cosmos',
      author_surname: 'Sagan',
      nonfiction: true,
      year_published: 1980
    )

    visit "/libraries/#{lib1.id}"

    expect(page).to have_content('Books: 2')
  end

  it 'links to child table' do
    lib1 = Library.create!(
      name: 'Mesa Public Library',
      employees: 15,
      open_weekends: true
    )

    visit "/libraries/#{lib1.id}"

    expect(page).to have_selector(:css, "a[href='/libraries/#{lib1.id}/books']")
  end
end
