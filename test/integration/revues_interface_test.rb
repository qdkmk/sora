require 'test_helper'

class RevuesInterfaceTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @book = books(:testbook)
  end

  test 'cannot create invalid params' do
    sign_in users(:michael)
    assert_no_difference 'Revue.count' do
      post revues_path, params: { revue: { title: '',
                                           content: 'Lorem ipsum',
                                           book_id: @book.id } }
    end
  end

  test 'delete revue after create' do
    assert_difference 'Revue.count', 1 do
      sign_in users(:michael)
      # valid post
      post revues_path, params: { revue: { title: 'lorem',
                                           content: 'Lorem ipsum',
                                           book_id: @book.id } }
    end
    assert_redirected_to "/books/#{@book.id}"
    follow_redirect!
    # delete revue
    assert_select 'a', text: 'delete'
    first_revue = @user.revues.first
    assert_difference 'Revue.count', -1 do
      delete revue_path(first_revue)
    end
    # doesnt appear delete link in other user's revue
    get user_path(users(:archer))
    assert_select 'a', text: 'delete', count: 0
  end
end
