require 'ganalytics/codes'

module Ganalytics
  class << self
    def init                                      
      ActionController::Base.send :include, Ganalytics::ActionControllerMethods
      ActionController::Base.send :after_filter, :add_ga_tracking_code
    end
    
    
  end
  
  module ActionControllerMethods
    def add_ga_tracking_code
      response.body = response.body.sub /<\/head>/oi, "#{Ganalytics::Codes.tracking_code}</head>"
    end
  end 
end


Ganalytics.init