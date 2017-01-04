require 'rails_helper'

describe 'As a user' do
  context 'I visit the take photo page' do
    xscenario 'I am able to take a photo of myself' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit take_photo_path
      click_on "Take Photo"

      expect(current_path).to eq(emotion_path)
      expect(page).to have_content("Great photo!")
    end
  end
end
