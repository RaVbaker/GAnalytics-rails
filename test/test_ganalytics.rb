require 'test_helper'

class TestGanalytics < ActionController::TestCase
  
  def setup
    @controller = PageController.new
    Ganalytics.reset
  end                          
  
  test "Ganalytics#reset always return empty Array" do
    assert_equal([], Ganalytics.reset)
    Ganalytics.queue << [:foo,:bar]
    assert_equal([], Ganalytics.reset)
  end                                
  
  test "Ganalytics#queue returns array of GA tracking queue" do
    assert_equal([], Ganalytics.queue)
    Ganalytics.push :foo, 1
    Ganalytics.push :bar, "123"
    assert_equal([[:foo, 1],[:bar, "123"]], Ganalytics.queue)
  end
  
  test "Ganalytics#set_account is a shortcut for pushing data to Ganalytics#queue" do
    account_id = "AU-123-11"
    Ganalytics.set_account account_id
    queue = Ganalytics.queue.clone
    Ganalytics.reset
    Ganalytics.push "_setAccount", account_id
    assert_equal(queue, Ganalytics.queue)
  end                                    
  
  test "Ganalytics#track_pageview is a shortcut for pushing data to Ganalytics#queue" do
    Ganalytics.track_pageview
    queue = Ganalytics.queue.clone
    Ganalytics.reset
    Ganalytics.push "_trackPageview"
    assert_equal(queue, Ganalytics.queue)
  end
  
  test "Put Google Analytics tracking code code before the closing </head> tag" do
    get :html_page
    assert_match(Ganalytics::Codes.tracking_code(Ganalytics.queue)+'</head>', @response.body)
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
  
  test "gaq.push added for page with ga_push helper usage" do
    Ganalytics.set_account "UA-XXX-X"
    Ganalytics.track_pageview
    get :html_page_with_ga
    assert_match /_gaq\.push\(.*\)/, @response.body
  end   
  
  test "Ganalytics has queue method which returns Array" do
    assert_kind_of Array, Ganalytics.queue
  end
end
