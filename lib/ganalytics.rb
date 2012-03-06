
require 'ganalytics/codes'
require 'ganalytics/action_controller_methods'

module Ganalytics
  class << self
    
    # Setup Ganalytics module and include it to Rails app
    def setup                                                            
      reset
      ActionController::Base.send :include, Ganalytics::ActionControllerMethods
      ActionController::Base.send :after_filter, :add_ga_tracking_code
    end
    
    # Resets queue of Google Analytics Tracker
    def reset
      queue.clear
    end
    
    # Gives access to Google Analytics Tracker queue
    def queue
      @@gaq ||= []
    end
    
    # This method allows to use Google Analytics JS API methods calls in Ruby.
    # Most of the time when you will use async API this way:
    #
    #   _gaq.push(['_trackEvent', 'Shoes', 'Zoom in', '+', 5]);
    #
    # Which you can transform to Ruby:
    #
    #   Ganalytics.push ['_trackEvent', 'Shoes', 'Zoom in', '+', 5]
    #
    # You can use it in any place in Ruby code and it would be transformed to JS.
    # But you have remember that it only works for pages which returns full page HTML. If it's an AJAX request such data would be lost. But I'm working on it.
    def push *args
      queue.push args
    end
    
    # This method allows to use Google Analytics JS API methods calls in Ruby.
    # Most of the time when you will use async API this way:
    #
    #   _gaq.push(['_trackEvent', 'Shoes', 'Zoom in', '+', 5]);
    #
    # Which you can transform to Ruby:
    #
    #   Ganalytics.track_event 'Shoes', 'Zoom in', '+', 5
    #
    # You can use it in any place in Ruby code and it would be transformed to JS.
    # But you have remember that it only works for pages which returns full page HTML. If it's an AJAX request such data would be lost. But I'm working on it.
    def method_missing name,*args
      args.unshift ga_method_name(name)
      push *args
    end
    
    private
      # Converts Ruby like method name into Google Analytics Tracker one.
      # From: 'track_pageview' into '_trackPageview'
      def ga_method_name name
        "_"+name.to_s.camelize(:lower)
      end     
  end
end


Ganalytics.setup if defined? Rails