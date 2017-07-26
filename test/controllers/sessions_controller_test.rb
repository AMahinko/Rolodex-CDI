require 'test_helper'
require 'capybara/rspec'
class SessionsControllerTest < ActionDispatch::IntegrationTest


  test "should get new" do
    get sessions_new_url
    assert_response :success
  end

end
