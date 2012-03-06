require 'test_helper'

class TestGanalytics < ActionController::TestCase
  
  def setup
    @controller = PageController.new
  end       
  
  test "Put Google Analytics tracking code code before the closing </head> tag" do
    get :html_page
    assert_match Ganalytics::Codes.tracking_code+'</head>', @response.body
  end
  
  test "Put Google Analytics tracking code to site without </head> tag does nothing" do
    get :json_page
    assert_equal @response.body, assigns(:json_response_text)
  end
  
  test "Put Google Analytics tracking code to site without text response" do
    get :nothing_page
    assert_equal @response.body, " "
  end
  
  test "When GA code putted add also support for _gaq =[] async JS defining values" do
    get :html_page
    assert_match "var _gaq = _gaq || [];", @response.body
  end
end
