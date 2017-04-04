require 'rails_helper'

feature "User sign in" do
  extend SubdomainHelpers 

  let!(:account) { create(:account) }
  let!(:sign_in_url) {"http://#{account.subdomain}.example.com/sign_in"}
  let!(:root_url) {"http://#{account.subdomain}.example.com/"}
  let(:subdomain_url) {"http://#{account.subdomain}.example.com"}


  within_account_subdomain do
    scenario "signs in as  an accoun owner successfully" do
      visit root_url
      expect(page.current_url).to eq sign_in_url
      fill_in "Email", with: account.owner.email 
      fill_in "Password", with: "password"
      click_button "Sign in"

      expect(page).to have_content("You are now signed in.")
      expect(page.current_url).to  eq root_url 
    end
  end

  scenario "attempts sign in with in valid password" do
    visit subscribem.root_url(subdomain: account.subdomain)
    expect(page.current_url).to eq sign_in_url
    fill_in "Email", with: account.owner.email 
    fill_in "Password", with: "wrongpassword"
    click_button "Sign in"
    expect(page).to have_content("Invalid email or password.")
  end

  scenario "attempts to sign in with invalid email" do
    visit subscribem.root_url(subdomain: account.subdomain)
    expect(page.current_url).to eq sign_in_url
    fill_in "Email", with: "testies@gmail.com" 
    fill_in "Password", with: "password"
    click_button "Sign in"
    expect(page).to have_content("Invalid email or password.")
  end

  scenario "cannot sign in if not part of this subdomain" do
    other_account = create(:account)
    visit subscribem.root_url(subdomain: account.subdomain)
    expect(page.current_url).to eq sign_in_url
    fill_in "Email", with: other_account.owner.email 
    fill_in "Password", with: "password"
    click_button "Sign in"
    expect(page).to have_content("Invalid email or password.")
  end
end
