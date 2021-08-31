require 'rails_helper'

describe 'edit library' do
  it 'allows for updates' do
    lib1 = Library.create!(
      name: 'Mesa Public Library',
      employees: 15,
      open_weekends: true
    )

    visit "/libraries/#{lib1.id}/edit"

    expect(page).to have_content('Edit')

    fill_in 'name', with: 'Phoenix'
    fill_in 'employees', with: 55
    uncheck 'open_weekends'
    click_button 'Update'

    expect(page).to have_content('Phoenix')
    expect(page).to have_content('Employees: 55')
    expect(page).to have_content('Open Weekends?: false')
  end
end
