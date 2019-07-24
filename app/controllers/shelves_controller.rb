class ShelvesController < ApplicationController
  def create
    @shelf = Shelf.create(:user_id => current_user.id, :book_tid => params[:tid])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @shelf = Shelf.find_by(book_tid: params[:tid],user_id: current_user.id)
    @shelf.destroy
    redirect_back(fallback_location: root_path)
  end
end
