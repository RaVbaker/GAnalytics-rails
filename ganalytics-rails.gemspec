$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ganalytics/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ganalytics-rails"
  s.version     = Ganalytics::VERSION
  s.authors     = ["Rafal 'RaVbaker' Piekarski"]
  s.email       = ["ravbaker@gmail.com"]
  s.homepage    = "https://github.com/RaVbaker/GAnalytics-rails"
  s.summary     = "This project is created to simplify usage of Google Analytics tracking functionalities in your Rails apps. "
  s.description = "See more on github: https://github.com/RaVbaker/GAnalytics-rails"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.1"

  s.add_development_dependency "sqlite3"
end
