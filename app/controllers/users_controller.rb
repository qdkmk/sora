class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
    @shelves = Shelf.where(user_id: @user.id)
  end
end