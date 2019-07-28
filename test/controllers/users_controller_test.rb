require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  #setup do
  #  get '/users/sign_in'
  #  sign_in users(:michael)
  #  post user_session_url
  #end

  test 'get own page' do
    get '/users/sign_in'
    assert_response :success
    sign_in users(:michael)
    get "/users/#{users(:michael).id}"
    assert_response :success
  end

  test 'should get other account page' do
    sign_in users(:michael)
    get "/users/#{users(:archer).id}"
    assert_response :success
  end

  test 'should redirect to root_path after logged in' do
    get '/users/sign_in'
    assert_response :success
    sign_in users(:michael)
    post user_session_url
    assert_redirected_to root_path
  end

  test 'admin user can access user index' do
    sign_in users(:michael)
    get '/users/index'
    assert_response :success
  end

  test 'cant access user index' do
    sign_in users(:archer)
    get '/users/index'
    assert_redirected_to root_path
  end

end
