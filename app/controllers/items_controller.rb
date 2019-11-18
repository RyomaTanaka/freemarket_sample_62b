class ItemsController < ApplicationController

  def show
  end
  def index
    # トップページ
    @items = Item.all
  end

  def new
    # 商品出品
    @item =  Item.new(item_params)
  end

  def create
    # 出品内容を保存
    Item.create(item_params)
    binding.pry
    # @item.user_id = current_user.id
    # @item.save

  end

  private
  def item_params
    params.permit(:name)
  end
end
