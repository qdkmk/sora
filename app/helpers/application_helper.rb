module ApplicationHelper
  def shelfid?(tid,pid)
    shelf = Shelf.find_by(book_tid: tid, pid: pid, user_id: current_user.id)
    shelfid = shelf.id
  end
  def is_current_user?(user)
    if user_signed_in?
      current_user == user
    end
  end
end
