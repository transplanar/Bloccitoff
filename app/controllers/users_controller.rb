class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @items = @user.items.all

    unless @user.public || current_user
      flash.now[:alert] = 'You must be signed in to view private topics.'
      # REVIEW is this the correct path?
      redirect_to new_session_path
     end
  end

  def index
    # TODO: Adjust visibility of other user profiles
    # @users = User.all
    @users = User.visible_to(current_user)
    # @users = User.visible_to
  end

  def current_user_home
    redirect_to current_user
  end
end
