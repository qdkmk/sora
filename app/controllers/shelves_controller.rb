# frozen_string_literal: true

class ShelvesController < ApplicationController
  before_action :logged_in_user?, only: [:create]

  def create
    @book = Book.find_by(tid: params[:tid], pid: params[:pid])
    @shelf = Shelf.create(user_id: current_user.id,
             book_tid: params[:tid], pid: params[:pid])
    # redirect_back(fallback_location: root_path)
  end

  def destroy
    @book = Book.find_by(tid: params[:tid], pid: params[:pid])
    @shelf = Shelf.find(params[:id])
    @shelf.destroy
    # redirect_back(fallback_location: root_path)
  end

  private

end
