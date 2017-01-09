require 'rails_helper'

describe 'As a user' do
  context 'I visit experiment_path and fill in the information' do
    scenario 'It records my emotions for five minutes' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit experiments_path

      click_on "New Experiment"
      expect(current_path).to eq(new_experiment_path)

      fill_in "Title", with: "Disco Music"
      fill_in "Hypothesis", with: "Makes me work happier"
      fill_in "Description", with: "Makes me work happier"

      expect(page).to have_content("5 minute experiment")
      click_on "Start Experiment"

      expect(current_path).to eq(experiment_path(Experiment.last.id))

      expect(page).to have_content('Your camera is active.  Experiment in Progress')
      expect(page).to have_content('Timer')
      end

    xscenario 'It can display a graph of my emotions over time' do

    end

    xscenario 'I can enter in a custom time for the experiment to run' do

    end
  end
end
