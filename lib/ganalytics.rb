
require 'ganalytics/codes'
require 'ganalytics/action_controller_methods'

module Ganalytics
  class << self
    def setup                                      
      ActionController::Base.send :include, Ganalytics::ActionControllerMethods
      ActionController::Base.send :after_filter, :add_ga_tracking_code
    end
  end
end


Ganalytics.setup