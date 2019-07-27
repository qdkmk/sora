# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :check_admin, only: [:index]
  before_action :authenticate_user!, only: [:show]
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @shelves = Shelf.where(user_id: @user.id)
    @revues = @user.revues.paginate(page: params[:page])
  end
end
