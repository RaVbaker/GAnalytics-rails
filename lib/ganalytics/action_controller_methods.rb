
module Ganalytics
  module ActionControllerMethods
    def add_ga_tracking_code
      response.body = response.body.sub /<\/head>/oi, "#{Ganalytics::Codes.tracking_code}</head>" if response.body.respond_to?(:sub)
    end
  end
end