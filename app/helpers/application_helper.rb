module ApplicationHelper
  def shelfid?(tid,pid)
    shelf = Shelf.find_by(book_tid: tid, pid: pid, user_id: current_user.id)
    shelfid = shelf.id
  end
end
