class ItemsController < ApplicationController
# before_action :set_item, only: [:show, :purchase, :edit, :exihibited_lists]


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
    # @item = Item.find(params[:id])
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
    Item.create(name: item_params[:name], body: item_params[:body], price: item_params[:price],  user_id: current_user.id)
  end

  def purchase
  end

  def exihibited_lists
        @items = Item.where(user_id: "1")

  end

  def exihibited
  end

end


private


def item_params
  prams.permit(:name, :body, :price)
end

def set_item
  @item = Item.includes(:images).find(params[:id])
end

# def update_item_params
#   params.require(item).permit(:name, :body, :price, :status, :user_id, :shipping_id, :order_status
#   [images_attributes: [:image, :_destory, :id]]).merge(user_id: current_user_id)
