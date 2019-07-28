require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get root_path
    assert_response :success
  end

  test 'get author page' do
    get author_books_path, params: { pid: books(:testbook).pid }
    assert_response :success
  end

  test 'get detail page' do
    get books_path, params: { id: books(:testbook).id }
    assert_response :success
  end
end
