require 'test_helper'

class RevueTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @book = books(:testbook)
    @revue = @user.revues.build(title:'Lorem', content: 'Lorem ipsum',
                                book_id: @book.id)
  end

  test 'should be valid' do
    assert @revue.valid?
  end

  test 'user id should be present' do
    @revue.user_id = nil
    assert_not @revue.valid?
  end

  test 'title should be present' do
    @revue.title = '   '
    assert_not @revue.valid?
  end

  test 'title should be at most 30 characters' do
    @revue.title = 'a' * 31
    assert_not @revue.valid?
  end

  test 'content should be present' do
    @revue.content = '   '
    assert_not @revue.valid?
  end

  test 'content should be at most 1500 characters' do
    @revue.content = 'a' * 1501
    assert_not @revue.valid?
  end

  test 'order should be most recent first' do
    assert_equal revues(:most_recent), Revue.first
  end

  test 'associated revues should be destroyed' do
    @user = users(:other)
    @user.save
    @user.revues.create!(title: 'lorem', content: "Lorem ipsum",
                        book_id: @book.id)
    assert_difference 'Revue.count', -1 do
      @user.destroy
    end
  end
end
