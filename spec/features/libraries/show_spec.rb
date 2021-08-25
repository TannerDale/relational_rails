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
end
