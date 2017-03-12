require 'rails_helper'

feature 'Accounts' do
  scenario 'creating an account' do
    visit subscribem.root_path
    click_link 'Account Sign Up'
    fill_in 'Name', with: 'David'
    click_button 'Create an Account'
    success_message = 'Your account has been succesfully created.' 
    expect(page).to have_content success_message 
  end
end
