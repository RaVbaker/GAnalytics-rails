
class PageController < ApplicationController
  def html_page
    
  end 
  
  def json_page
    @json_response_text = '{lorem:"ipsum"}'
    render text: @json_response_text
  end
  
  def nothing_page
    render nothing:true
  end
end