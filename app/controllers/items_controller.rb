class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :purchase]
  def index
    @items = Item.all.limit(10).order("created_at DESC")
    @images = Image.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    # 商品出品
    @shipping = Shipping.new
    item = @shipping.items.build
    item.images.build

    # @category_parent_array = ["---"]
    # Categorie.where(ancestry: nil).each do |parent|
    #   @category_parent_array << parent.name
    # end
  end

  def create
    # 出品内容を保存
    @shipping = Shipping.create(shipping_params)
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

  private
  def set_item
    @item = Item.includes(:images).find(params[:id])
  end
  
  def shipping_params
    params.require(:shipping).permit(:cost_burden, :period_before_shipping, :prefecure,
    items_attributes: [:name, :body, :status, :price, :condition, images_attributes: [:url]])
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
