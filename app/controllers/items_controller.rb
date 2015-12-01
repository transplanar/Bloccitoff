class ItemsController < ApplicationController
  def create
    @item = Item.new

    @item.assign_attributes(item_params)

# NOTE was there a faster way to do this?
    # @item.name = params[:item][:name]
    @item.user = current_user
  end

  private

  def item_params
    # NOTE Question- why not include :user with this?
    params.require(:name)
  end
end
