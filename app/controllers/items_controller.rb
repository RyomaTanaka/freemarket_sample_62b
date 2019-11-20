class ItemsController < ApplicationController
  def index
    @items = Item.all.order("crated_at DESC")
    @images = Image.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    if @item.update(update_item_params)
      redirect_to root_path
    else
      redirect_to edit_item_path
    end
  end

  def destroy
    # if @item.user_id == current_user.id && @item.destroy
    #   redirect_to root_path
    # else
    #   redirect_to action: :show
    # end
  end

  def create
  end

  def purchase
  end

  def exihibited_lists
  end

  def exihibited
  end

end


# private

# def update_item_params
#   params.require(item).permit(:name, :body, :price, :status, :user_id, :shipping_id, :order_status
#   [images_attributes: [:image, :_destory, :id]]).merge(user_id: current_user_id)
