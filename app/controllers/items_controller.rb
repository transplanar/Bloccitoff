class ItemsController < ApplicationController
  def create
    @item = current_user.items.new(item_params)

    if @item.save
      flash[:notice] = "Task saved"
      # TODO Remove this line after Ajax implementation
      # FIXME nesting under user isn't working
      # redirect_to [current_user, @item]
      redirect_to current_user
      # user_path(current_user)
    else
      flash[:error] = "Error saving task. Please try again."
      # TODO Remove this line after Ajax implementation
      render :new
    end

    # if @topic.save
    #       @topic.labels = Label.update_labels(params[:topic][:labels])
    #       redirect_to @topic, notice: 'Topic was saved successfully.'
    #     else
    #       flash[:error] = 'Error creating topic. Please try again.'
    #       render :new
    #     end


    #  redirect_to current_user

    #  TODO Uncomment for Ajax
    #  respond_to do |format|
    #    format.html
    #    format.js
    #  end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
