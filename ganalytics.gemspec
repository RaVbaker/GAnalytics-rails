$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ganalytics/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ganalytics"
  s.version     = Ganalytics::VERSION
  s.authors     = ["Rafal 'RaVbaker' Piekarski"]
  s.email       = ["ravbaker@gmail.com"]
  s.homepage    = "N/A"
  s.summary     = "Gives ruby interface for google analytics usage on rails sites."
  s.description = "Soon more."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.1"

  s.add_development_dependency "sqlite3"
end
