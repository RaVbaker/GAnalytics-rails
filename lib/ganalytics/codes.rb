module Ganalytics
  module Codes
    
    # Source of code from: http://code.google.com/apis/analytics/docs/tracking/asyncUsageGuide.html#CommonPitfalls
    def self.tracking_code
      <<-CODE
      <script>(function() {
          var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
          ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
          var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();</script>
      CODE
    end
  end
end