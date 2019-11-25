class ItemsController < ApplicationController

  def index
    # トップページ
    @items = Item.all.limit(10).order("created_at DESC")
    @images = Image.all
  end




  def show
    @item = Item.find(params[:id])

  end

  def new
    # 商品出品
    @item = Item.new
    image = @item.images.build
    # binding.pry

    # @item = Item.new
    # @item_image = @item.images.build

    #商品カテゴリー
    # @category_parent_array = ["---"]
    # Categorie.where(ancestry: nil).each do |parent|
    #   @category_parent_array << parent.name
    # end
  end


  def create
    # Item.create(name: item_params[:name], body: item_params[:body], price: item_params[:price],  user_id: current_user.id)
    #商品出品
    # binding.pry
    @item = Item.create(item_params)
    # binding.pry
    # if @shipping.save
    #   params[:images][:url].each do |image|
    #     @shipping.images.create(url: image, item_id: @hipping.id)
      # end
      redirect_to action: :index
    # else
    #   redirect_to action: :new
    # end
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
    # if @item.find(:id)
    #   redirect_to root_path notice: '商品を削除しました'
    # else
      redirect_to list_items_mypages_path, notice: '削除をやめました'
    # end
  end

  def purchase
    #購入
  end


  private
  def set_item
    #itemのidを持ってくる
    @item = Item.includes(:images).find(params[:id])
  end

  def item_params
    #出品itemのparams
    params.require(:item).permit(:cost_burden, :period_before_shipping, :prefecture, :name, :body, :status, :order_status, :price,
    images_attributes: [:image])
  end

  def exihibited_lists
    @items = Item.where(user_id: current_user)

  end

  def exihibited
    # @items = Item.where(user_id: current_user)
    @item = Item.find(params[:id])

  end

end


private


def item_params
  params.permit(:name, :body, :price)
end

def set_item
  @item = Item.includes(:images).find(params[:id])
end

# def update_item_params
#   params.require(:shipping).permit(:cost_burden, :period_before_shipping, :prefecure,
#   items_attributes: [:name, :body, :status, :price, :condition, images_attributes: [:image]])
