require_dependency "subscribem/application_controller"

module Subscribem
  class AccountsController < ApplicationController

    def new
      @account = Subscribem::Account.new 
      @account.build_owner
    end

    def create
      @account = Subscribem::Account.create_with_owner(account_params)
      if @account.save
        request.env['warden'].set_user(@account.owner, scope: :user)
        request.env['warden'].set_user(@account, scope: :account) 
        flash[:success] = "Your account has been successfully created."
        redirect_to subscribem.root_url(subdomain: @account.subdomain)
      else
        flash[:success] = "Sorry, your account could not be created"
        render :new 
      end
    end

    def account_params
      params.require(:account).permit(:name, :subdomain, :confirmation_url, owner_attributes: [:email, :password, :password_confirmation])
    end
  end
end
