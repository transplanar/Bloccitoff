class ItemsController < ApplicationController
  def create
    # # NOTE Old
    # @item = current_user.items.new(item_params)
    # item_log = @item.name
    #
    # if @item.save
    #   flash[:notice] = "Task \"#{item_log}\" created"
    #   redirect_to current_user
    # else
    #   flash[:error] = 'Error saving task. Please try again.'
    #   render :new
    # end

    # NOTE New
    # user = params(:user)
    # TODO Condense with ternary operator
    @user = User.find(params[:user_id]) if params[:user_id].present?
    @user ||= current_user
    @item = @user.items.new(item_params)
    @item.save

    respond_to do |format|
      format.html { redirect_to current_user }
      format.js
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      # REVIEW This doesn't appear to do anything...?
      format.html { redirect_to current_user }
      format.js
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
