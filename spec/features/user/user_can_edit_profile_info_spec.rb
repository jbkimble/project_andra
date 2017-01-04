require 'rails_helper'

describe 'As a logged in user' do
  context 'I visit my profile page' do
    scenario 'And I can edit my profile information' do
      user = create(:user)
      visit login_path
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_on "Login"
      click_on "Profile"

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content(user.first_name)
      expect(page).to have_content(user.email)

      click_on "Edit Profile Info"
      expect(current_path).to eq(edit_user_path(user.id))

      fill_in "Email", with: "123@example.com"
      fill_in "First Name", with: "ThisIsATest"
      fill_in "Password", with: user.password
      fill_in "user[password_confirmation]", with: user.password

      click_on "Update Profile"
      expect(current_path).to eq(user_path(user))
      expect(page).to have_content("123@example.com")
      expect(page).to have_content("ThisIsATest")
    end
  end

  context 'I visit my profile page' do
    scenario 'I fail to enter my password correctly when updating my information' do
      user = create(:user)
      visit login_path
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_on "Login"
      click_on "Profile"

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content(user.first_name)
      expect(page).to have_content(user.email)

      click_on "Edit Profile Info"
      expect(current_path).to eq(edit_user_path(user.id))

      fill_in "Email", with: "123@example.com"
      fill_in "First Name", with: "ThisIsATest"
      fill_in "Password", with: "Bob"
      fill_in "user[password_confirmation]", with: user.password

      click_on "Update Profile"
      expect(current_path).to eq(user_path(user))
      expect(page).to have_content("Your account failed to update")
    end
  end
end
