class ItemsController < ApplicationController

  def show
  end
  def index
    # トップページ
    @items = Item.all
  end

  def new
    # 商品出品
    @item = Item.new
    @item.image_build
    @item.build_shipping
  end

  def create
    # 出品内容を保存
    @item = Item.new(item_params)
    @item.save
    # binding.pry
    redirect_to :root
    # binding.pry
    # @item.user_id = current_user.id
    # @item.save

  end

  private
  def item_params
    params.require(:item).permit(:name, :body, :status)
    # item_shipping_attributes: [:cost_burden, :period_before_shipping, :prefecure]
  end
end