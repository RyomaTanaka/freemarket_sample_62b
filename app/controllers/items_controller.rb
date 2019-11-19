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
    @shipping.items.build
  end

  def create
    # 出品内容を保存
    @shipping = Shipping.new(shipping_params)
    @shipping.save

    redirect_to :root

  end

  private
  def shipping_params
    params.require(:shipping).permit(:prefecure, :cost_burden, :period_before_shipping,
    items_attributes: [:body, :name, :statsu])
    # binding.pry
    # 
  end
end