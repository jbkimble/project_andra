require 'rails_helper'

describe 'as a user' do
  context 'I create a new experiment' do
    scenario 'and the experiment runs for that length of time' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit experiments_path
      click_on "New Experiment"

      fill_in "Title", with: "This"
      fill_in "Hypothesis", with: "That"
      fill_in "Description", with: "Bang"
      select('5', :from => 'experiment[minutes]')
      click_on "Create Experiment"
      
      expect(current_path).to eq(new_experiment_run_path(Experiment.last))
      click_on "Start Experiment"
    end
  end
end
