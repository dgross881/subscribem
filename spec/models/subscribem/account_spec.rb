require 'rails_helper'

describe Subscribem::Account, type: :model do
  it 'can be created with an owner' do
    params = {
      name: "Test Account",
      subdomain: "test",
      owner_attributes: {
        email: "use@example.com", 
        password: "password",
        password_confirmation: "password" 
      }
    }
    account = Subscribem::Account.create_with_owner(params)
    expect(account.persisted?).to be_truthy
    expect(account.users.first).to eq account.owner 
  end
end
