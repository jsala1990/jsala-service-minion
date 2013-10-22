require 'test_helper'

class HttpRequestRecorderControllerTest < ActionController::TestCase
  test "should respond with 200" do
    post :record, :url => 'here is a url'
    assert_response(:success)
  end
end
