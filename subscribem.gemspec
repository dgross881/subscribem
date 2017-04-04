$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "subscribem/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "subscribem"
  s.version     = Subscribem::VERSION
  s.authors     = ["dgross881"]
  s.email       = ["dgross881@gmail.com"]
  s.homepage    = "https://github.com/dgross881"
  s.summary     = "This is a sass multitendancy applicaiton"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.2"
  s.add_dependency 'bcrypt', '~> 3.1.11'
  s.add_dependency 'warden', '~> 1.2', '>= 1.2.7'

  s.add_development_dependency 'pry-byebug', '~> 3.4', '>= 3.4.2'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency "factory_girl"

  s.add_development_dependency "pg"
end
