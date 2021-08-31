require 'rails_helper'

describe 'new library' do
  it 'has a form for new library' do
    visit '/libraries/new'

    fill_in 'name', with: 'Test Library'
    fill_in 'employees', with: 99
    check 'open_weekends'

    click_button 'Create Library'

    expect(current_path).to eq('/libraries')
    expect(page).to have_content('Test Library')
  end
end
