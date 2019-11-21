class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :purchase]
  def index
    @items = Item.all.limit(10).order("created_at DESC")
    @images = Image.all
  end

  def show
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

end
