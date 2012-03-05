require 'test_helper'

class GanalyticsTest < ActionController::TestCase
  
  def setup
    @controller = TestController.new
  end
  
  test "truth" do
    assert_kind_of Module, Ganalytics
  end                    
  
  test "Put Google Analytics tracking code code before the closing </head> tag" do
    get :html_page
    response_body = @response.body
    assert_match Ganalytics::Codes.tracking_code+'</head>', response_body
  end
end
