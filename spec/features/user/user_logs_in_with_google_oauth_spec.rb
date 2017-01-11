require 'rails_helper'

describe 'A visitor logs in' do
  xscenario 'using google oauth' do
    stub_omniauth
    visit root_path

    click_on "Create An Account"
    click_on "Sign in with Google"

    expect(current_path).to eq(experiments_path)
    expect(page).to have_content("New Experiment")
    expect(page).to have_link("Logout")
  end

end
