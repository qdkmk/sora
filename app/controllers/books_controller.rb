class BooksController < ApplicationController
  before_action :set_book,only:[:show,:edit,:update,:destroy]
  def index
    @book = Book.all
  end
  def show
  end
  def search
    @books = Book.search(params[:search])
  end
end

  private
    def set_book
      @book = Book.find(params[:id])
    end
