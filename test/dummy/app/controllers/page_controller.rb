
class PageController < ApplicationController
  
  def html_page
    render :html_page
  end 
  
  def json_page
    @json_response_text = '{lorem:"ipsum"}'
    render text: @json_response_text
  end
  
  def nothing_page
    render nothing:true
  end
  
  def html_page_with_ga
    # Ganalytics.set_account "UA-XXXXX-X"
    Ganalytics.track_pageview
    render :html_page
  end
end