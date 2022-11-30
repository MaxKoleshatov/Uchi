require 'rails_helper'

feature 'User can sign out' do

  given(:user) {create(:user)}

  scenario 'The user can sign out of the system' do
    sign_in(user)
    click_on 'Sign out'
    expect(page).to have_content 'Signed out successfully.'
  end
end