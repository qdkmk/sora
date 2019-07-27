# frozen_string_literal: true

class RevuesController < ApplicationController
  before_action :logged_in_user?, only: %i[create destroy]
  before_action :correct_user,    only: :destroy

  def create
    @revue = current_user.revues.build(revue_params)
    if @revue.save
      flash[:notice] = '投稿を1件保存しました'
      redirect_to book_path(id: @revue.book_id)
    else
      flash[:alert] = '保存に失敗しました。'
      @book = Book.find(@revue.book_id)
      @shelf = Shelf.new
      @revues = Revue.where(book_id: @revue.book_id)
                     .paginate(page: params[:page], per_page: 15)

      render 'books/show', id: @revue.book_id
    end
  end

  def edit; end

  def destroy
    @revue.destroy
    flash[:notice] = '投稿を1件削除しました。'
    redirect_to request.referrer || root_path
  end

  private

  def revue_params
    params.require(:revue).permit(:content, :title, :book_id)
  end

  def correct_user
    @revue = current_user.revues.find_by(id: params[:id])
    redirect_to root_path if @revue.nil?
  end
end
