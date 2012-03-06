
require 'ganalytics/codes'
require 'ganalytics/action_controller_methods'

module Ganalytics
  class << self
    
    def setup                                                            
      reset
      ActionController::Base.send :include, Ganalytics::ActionControllerMethods
      ActionController::Base.send :after_filter, :add_ga_tracking_code
    end
    
    def reset
      @@gaq = []
    end
    
    def queue
      @@gaq ||= []
    end
    
    def push *args
      queue.push args
    end
    
    def set_account account_id
      push "_setAccount", account_id
    end
    
    def track_pageview url=nil
      push "_trackPageview", url
    end
  end
end


Ganalytics.setup