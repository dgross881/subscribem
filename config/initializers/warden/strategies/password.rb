Warden::Strategies.add(:password) do
  def subdomain 
    ActionDispatch::Http::URL.extract_subdomains(request.host, 1) 
  end

  def valid?
    host = request.host  
    subdomain.present? && params["user"]
  end

  def authenticate!
    return fail! unless account = Subscribem::Account.find_by_subdomain(subdomain)
    return fail! unless user = account.users.find_by_email(params["user"]["email"])
    return fail! unless user.authenticate(params["user"]["password"]) 
    success! user 
  end
end
