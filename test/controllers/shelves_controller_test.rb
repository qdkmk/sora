require 'test_helper'

class ShelvesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @book = books(:testbook)
    @user = users(:michael)
  end


  test 'create shelf' do
    sign_in users(:michael)
    assert_difference 'Shelf.count', 1  do
      @shelf = Shelf.create(user_id: @user.id,
                         tid: @book.tid, pid: @book.pid)
    end
    assert_difference 'Shelf.count', -1  do
      delete shelf_path(@shelf.id), xhr:true
    end
  end

  test 'create shelf xhr post' do
    assert_difference 'Shelf.count', 1  do
      sign_in users(:michael)
      post shelves_path, params: { shelf: { user_id: users(:michael).id,
                                            tid: @book.tid,
                                            pid: @book.pid } },xhr:true
    end
  end

  test 'create should require logged-in user' do
    assert_no_difference 'Shelf.count' do
      post shelves_path, params:{ user_id: @user.id,tid: @book.tid,
                                 pid: @book.pid }
    end
     #assert_redirected_to user_session_path
     assert_redirected_to new_user_registration_path
  end

  test 'delete should require current_users shelf' do
    # create
    assert_difference 'Shelf.count', 1  do
      @shelf = Shelf.create(user_id: @user.id,
                         tid: @book.tid, pid: @book.pid)
    end
    # sign in as other user and delete
    assert_no_difference 'Shelf.count' do
      sign_out :user
      sign_in users(:archer)
      get books_path(@book.id)
      delete shelf_path(@shelf.id), xhr:true
    end
  end
end
