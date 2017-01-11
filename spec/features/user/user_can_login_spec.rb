require 'rails_helper'

describe 'As a user with an account' do
  context 'I visit login_path and enter my information' do
    it 'logs me in' do
      user = create(:user)

      visit root_path
      click_on "Login"

      expect(current_path).to eq(login_path)
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password

      click_on "Login"

      expect(current_path).to eq(experiments_path)
      # expect(page).to have_content("Welcome back #{user.first_name}")
      expect(page).to have_button("New Experiment")
      # # expect(page).to have_content("Smart Data Analysis")
      # expect(page).to have_button("See The Data")
      # expect(page).to_not have_content("Login")
      # expect(page).to_not have_button("Create Account")
    end
  end

  context 'I enter in the wrong information' do
    it 'It alerts me and I stay on the same page' do
      user = create(:user)

      visit root_path
      click_on "Login"

      expect(current_path).to eq(login_path)
      fill_in "Email", with: user.email
      fill_in "Password", with: "12"

      click_on "Login"

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Login failed, please try again.")
    end
  end
end
