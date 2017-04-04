module Subscribem
  class Account < ApplicationRecord
    belongs_to :owner, class_name: 'Subscribem::User'
    accepts_nested_attributes_for :owner
    validates :subdomain, presence: true, uniqueness: true 
    has_many :members, class_name: "Subscribem::Member"
    has_many :users, through: :members 

    def self.create_with_owner(params={})
      account = new(params)
      if account.save
        account.users << account.owner 
      end
      account 
    end
  end
end
