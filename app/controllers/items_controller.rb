class ItemsController < ApplicationController

  def show
  end
  def index
    # トップページ
    @shipping = Shipping.all
    
  end

  def new
    # 商品出品
    @shipping = Shipping.new
    item = @shipping.items.build
    item.images.build
    # binding.pry

    # @item.images.build

  end

  def create
    # 出品内容を保存
    @shipping = Shipping.create(shipping_params)


  end

  private
  def shipping_params
    params.require(:shipping).permit(:cost_burden, :period_before_shipping, :prefecure,
    items_attributes: [:name, :body, :status, :price, :condition, images_attributes: [:image_url]])
  end
end