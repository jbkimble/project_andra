require 'rails_helper'

describe 'As a visitor' do
  context 'I click the link to create an account' do
    scenario 'And I am able to enter my information and create an account' do
      visit root_path
      expect(page).to have_content('Login')

      click_on "Create An Account"

      fill_in 'First Name', with: 'James'
      fill_in 'Email', with: 'j@gmail.com'
      fill_in 'Password', with: '123'
      fill_in 'Confirm password', with: '123'

      click_on 'Create Account'
      # expect(page).to have_content('Welcome James your account was successfully created!')
      expect(page).to have_link('Logout')
      expect(page).to_not have_link('Login')
      expect(current_path).to eq(root_path)
    end
  end

  context 'I click the link to create an account' do
    scenario 'And I fail to enter to correct information to create and account' do
      visit root_path
      expect(page).to have_content('Login')

      click_on "Create An Account"

      fill_in 'First Name', with: 'James'
      fill_in 'Email', with: 'j@gmail.com'
      fill_in 'Password', with: '123'
      fill_in 'Confirm password', with: '100'

      click_on 'Create Account'
      # expect(page).to have_content('Welcome James your account was successfully created!')
      expect(page).to have_content("Your account creation failed, please try again.")
      expect(page).to have_link('Login')
      expect(current_path).to eq(users_path)
    end
  end
end
