class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    # @user = User.find(params[:id])
    # @user = current_user
    @user = User.find(params[:id])
    # @user = current_user
    # @items = Item.all
    @items = @user.items.all
  end

  def index
    #TODO Adjust visibility of other user profiles
    @users = User.all
  end

  def current_user_home
    redirect_to current_user
  end
end
