require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  test 'could login' do
    get '/users/sign_in'
    sign_in users(:michael)
    post user_session_url

    # If you want to test that things are working correctly, uncomment this below:
     follow_redirect!
     assert_response :success
  end



end
