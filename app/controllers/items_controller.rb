class ItemsController < ApplicationController
  def create
    @item = current_user.items.new(item_params)

    if @item.save
      flash[:notice] = "Task saved"
      # TODO Remove this line after Ajax implementation
      redirect_to current_user
    else
      flash[:error] = "Error saving task. Please try again."
      # TODO Remove this line after Ajax implementation
      render :new
    end

    #  redirect_to current_user

    #  TODO Uncomment for Ajax
    #  respond_to do |format|
    #    format.html
    #    format.js
    #  end
  end

  def destroy
    @item = current_user.items.find(params[:id])
    item_log = @item.name

    if @item.destroy
      flash[:notice] = "Task \"#{item_log}\" destroyed"
      # TODO Remove this line after Ajax implementation
      redirect_to current_user
    else
      flash[:error] = "Error deleting task. Please try again."
      # TODO Remove this line after Ajax implementation
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
