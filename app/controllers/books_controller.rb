class BooksController < ApplicationController
  before_action :set_book,only:[:show,:edit,:update,:destroy]

  def index
    @books = Book.paginate(page: params[:page], per_page: 30)
  end

  def show
    @book = Book.find(params[:id])
    @shelf = Shelf.new
  end

  def search
    @books = Book.search(params[:search]).paginate(page: params[:page], per_page: 30)
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
