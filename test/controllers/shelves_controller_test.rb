require 'test_helper'

class ShelvesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get shelves_create_url
    assert_response :success
  end

  test "should get destroy" do
    get shelves_destroy_url
    assert_response :success
  end

end
