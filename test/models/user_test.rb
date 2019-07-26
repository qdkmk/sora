# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(
      name: 'user_mytest1',
      email: 'example_mytest1@example.com',
      password: 'password_mytest1',
      password_confirmation: 'password_mytest1'
    )
  end

  test 'should bea valid' do
    assert @user.valid?
  end
  test 'name should be present' do
    @user.name = '     '
    assert_not @user.valid?
  end
end