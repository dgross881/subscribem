require 'rails_helper'

feature 'Accounts' do
  scenario 'creating an account' do
    create_account('test1')
    success_message = 'Signed in as dave@gmail.com' 
    expect(page).to have_content success_message 
    expect(page.current_url).to have_content 'http://test1.example.com/'
  end

  scenario 'insure domain uniqueness' do 
    owner = Subscribem::User.create!(email: 'test@gmail.com', password: 'password', password_confirmation: 'password')
    Subscribem::Account.create!(:subdomain => "test2", :name => "Test", owner_id: owner.id)
    create_account('test2')
    expect(page).to have_content('Sorry, your account could not be created')
  end
end

def create_account(account)
  visit subscribem.root_path
  click_link 'Account Sign Up'
  fill_in 'Name', with: 'David'
  fill_in 'Subdomain', with: account 
  fill_in 'Email', with: 'dave@gmail.com'
  fill_in 'Password', with: 'password'
  fill_in 'Password confirmation', with: 'password'
  click_button 'Create an Account'
end
