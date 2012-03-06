module Ganalytics
  module Codes

    # Source of code from: http://code.google.com/apis/analytics/docs/tracking/asyncUsageGuide.html#CommonPitfalls
    def self.tracking_code gaq=[]
      
      <<-CODE
      <script>
      var _gaq = _gaq || [];
      #{gaq_pushes(gaq)}
      
      (function() {
          var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
          ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
          var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();</script>
      CODE
    end
    
    
    def self.gaq_pushes gaq               
      "_gaq.push("+gaq.to_json[1..-2]+");" unless gaq.empty?
    end
  end
end