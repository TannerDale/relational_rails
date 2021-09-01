require 'rails_helper'

describe 'libraries show page' do
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
  end

  it 'has attributes' do
    visit "/libraries/#{@lib1.id}"

    expect(page).to have_content(@lib1.name)
    expect(page).to have_content("Employees: #{@lib1.employees}")
    expect(page).to have_content("Open Weekends?: #{@lib1.open_weekends}")
  end

  it 'has book count' do
    visit "/libraries/#{@lib1.id}"

    expect(page).to have_content('Books: 2')
  end

  it 'has links to child table' do
    visit "/libraries/#{@lib1.id}"

    expect(page).to have_selector(:css, "a[href='/libraries/#{@lib1.id}/books']")
  end

  it 'has delete functionality' do
    visit "/libraries/#{@lib1.id}"

    click_on "Delete Library"

    expect(page).not_to have_content('Mesa Public Library')
  end
end
