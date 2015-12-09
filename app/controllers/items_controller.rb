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

    # @item = current_user.items.new(item_params)
    # @item = @user.items.new(item_params)
    @item = Item.new(item_params)
    # TODO Make sure user cannot delete items they do not own
    # @item = Item.new(item_params)
    @item.save

    respond_to do |format|
      # format.html { redirect_to current_user }
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    # @item = current_user.items.find(params[:id])
    # @item = @user.items.find(params[:id])
    @item = Item.find(params[:id])
    # @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      # format.html { redirect_to current_user }
      format.html { redirect_to @user }
      format.js
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
