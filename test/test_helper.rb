# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rails/test_help"

# color output from test/unit 2.X.X
require 'test/unit/ui/console/testrunner'

class Test::Unit::UI::Console::TestRunner
  def guess_color_availability 
    true 
  end
end

Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }
