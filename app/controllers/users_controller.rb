class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    # @user = User.find(params[:id])
    @user = current_user
    @items = Items.all
  end
end
