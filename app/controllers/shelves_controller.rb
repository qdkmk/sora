# frozen_string_literal: true

class ShelvesController < ApplicationController
  before_action :logged_in_user?, only: [:create,:destroy]
  #before_action :shelf_params, only: [:create]
  before_action :set_shelf, only: [:destroy]

  def create
    @shelf = Shelf.create(shelf_params)
    @book = Book.find_by(tid: params[:shelf][:tid],
                         pid: params[:shelf][:pid])
    # redirect_back(fallback_location: root_path)
  end

  def destroy
    if @shelf.user_id == current_user.id
      @book = Book.find_by(tid: @shelf.tid,
                           pid: @shelf.pid)
      @shelf.destroy
    else
     redirect_to root_path
   end
  end

  private
    def shelf_params
      params.require(:shelf).permit(:user_id,:tid, :pid)
    end
    def book_params
      params.require(:shelf).permit(:tid, :pid)
    end
    def set_shelf
      @shelf = Shelf.find(params[:id])
    end
end
