class BooksController < ApplicationController
  before_action :set_book,only:[:show,:edit,:update,:destroy]

  def index
    @books = Book.order("ranking").paginate(page: params[:page], per_page: 30)
  end

  def show
    @book = Book.find(params[:id])
    @shelf = Shelf.new
  end

  def search
    #@books = Book.search(params[:search]).paginate(page: params[:page], per_page: 30)
    if params[:time] != 0 then
    @books = Book.where("(title LIKE ? OR author LIKE ?) AND characount < ?", "%#{params[:search]}%","%#{params[:search]}%","#{params[:time].to_i}")
                .order("characount DESC ,ranking ASC").paginate(page: params[:page], per_page: 30)
                .paginate(page: params[:page], per_page: 30)
    end
  end
  def author
    @books = Book.where(pid: params[:pid])
    @author = Book.where(pid: params[:pid]).limit(1).select(:author)
  end
end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def already_shelved?(user,book)
     user.shelves.exists?(book_tid: book.tid)
    end
