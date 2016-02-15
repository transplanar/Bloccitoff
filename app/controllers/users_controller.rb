class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id]) if params[:id].present?
    @items = @user.items.all

    unless @user.public || @user == current_user
      flash.now[:alert] = 'You must be signed in to view private profiles.'
      redirect_to users_path
    end
  end

  def index
    @users = User.visible_to(current_user)
  end

  def current_user_home
    redirect_to current_user
  end
end
