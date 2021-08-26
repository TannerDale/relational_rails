require 'rails_helper'

describe 'libraries index page' do
  it 'shows all library names' do
    lib1 = Library.create!(
      name: 'Mesa Public Library',
      employees: 15,
      open_weekends: true
    )
    lib2 = Library.create!(
      name: 'Maricopa Public Library',
      employees: 9,
      open_weekends: false
    )

    visit '/libraries'

    expect(page).to have_content(lib1.name)
    expect(page).to have_content(lib1.created_at)

    expect(page).to have_content(lib2.name)
    expect(page).to have_content(lib2.created_at)
  end
end
