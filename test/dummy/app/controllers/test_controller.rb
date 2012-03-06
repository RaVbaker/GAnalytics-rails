
class TestController < ApplicationController
  def html_page
    
  end 
  
  def json_page
    @json_response_text = '{lorem:"ipsum"}'
    render text: @json_response_text
  end
end