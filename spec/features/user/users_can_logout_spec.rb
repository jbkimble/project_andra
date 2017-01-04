require 'rails_helper'

describe 'As a logged in user' do
  context 'I click logout' do
    scenario 'I am logged out of the application' do
      visit signup_path

      fill_in 'First Name', with: 'James'
      fill_in 'Email', with: 'j@gmail.com'
      fill_in 'Password', with: '123'
      fill_in 'Confirm password', with: '123'

      click_on 'Create Account'
      click_on 'Logout'

      # expect(page).to have_content('Successfully Logged Out')
      expect(page).to have_content('Login')
      expect(page).to_not have_content('Logout')
    end
  end
end
