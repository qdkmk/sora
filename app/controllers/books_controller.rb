# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :set_book, only: [:show]
  before_action :check_admin, only: [:search]

  def index
    @books = Book.order('ranking').paginate(page: params[:page], per_page: 30)
  end

  def show
    @book = Book.find(params[:id])
    @shelf = Shelf.new
  end

  def search
    # @books = Book.search(params[:search]).paginate(page: params[:page], per_page: 30)
    if params[:time].nil? || params[:time].zero
      @books = Book.where('title LIKE ? OR author LIKE ?',
                          "%#{params[:search]}%", "%#{params[:search]}%")
                   .order('characount DESC ,ranking ASC')
                   .paginate(page: params[:page], per_page: 30)
                   .paginate(page: params[:page], per_page: 30)
    else
      @books = Book.where('(title LIKE ? OR author LIKE ?) AND characount < ?',
                          "%#{params[:search]}%", "%#{params[:search]}%",
                          params[:time].to_i.to_s)
                   .order('characount DESC ,ranking ASC')
                   .paginate(page: params[:page], per_page: 30)
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

def already_shelved?(user, book)
  user.shelves.exists?(book_tid: book.tid)
end
