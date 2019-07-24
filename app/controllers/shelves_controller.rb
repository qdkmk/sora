class ShelvesController < ApplicationController
  before_action :logged_in_user?,only:[:create]

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
