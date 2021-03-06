# frozen_string_literal: true

require 'test_helper'

class RevuesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  include ApplicationHelper
  def setup
    @revue = revues(:orange)
    @book = books(:testbook)
  end

  test 'should redirect create when not logged in' do
    assert_no_difference 'Revue.count' do
      post revues_path, params: { revue: { title: 'lorem',
                                           content: 'Lorem ipsum',
                                           book_id: @book.id } }
    end
    assert_redirected_to new_user_registration_path
  end

  test 'should redirect destroy when not logged in' do
    assert_no_difference 'Revue.count' do
      delete revue_path(@revue)
    end
    assert_redirected_to new_user_registration_path
  end

  test 'should redirect destroy for wrong revue' do
    get '/users/sign_in'
    sign_in users(:michael)
    post user_session_url
    follow_redirect!
    assert_response :success

    revue = revues(:ants)
    assert_no_difference 'Revue.count' do
      delete revue_path(revue)
    end
    assert_redirected_to root_path
  end

end
