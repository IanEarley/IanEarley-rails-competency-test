require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get admin_dash" do
    get pages_admin_dash_url
    assert_response :success
  end

end
