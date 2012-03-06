
module Ganalytics
  module ActionControllerMethods
    
    def add_ga_tracking_code                        
      gaq = Ganalytics.queue                                                    
      tracking_code = Ganalytics::Codes.tracking_code(gaq)
      response.body = response.body.sub /<\/head>/oi, "#{tracking_code}</head>" if response.body.respond_to?(:sub)
    end
    
    def _ga_push *args
      Ganalytics.push *args
    end
  end
end