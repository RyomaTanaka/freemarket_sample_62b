class ItemsController < ApplicationController

  def index
    # トップページ
    @items = Item.all.limit(10).order("created_at DESC")
    @shipping = Shipping.all
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
    # binding.pry

    # @item = Item.new
    # @item_image = @item.images.build

    #商品カテゴリー
    @category_parent_array = ["---"]
    Categorie.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end


  def create
    # Item.create(name: item_params[:name], body: item_params[:body], price: item_params[:price],  user_id: current_user.id)
    #商品出品
    # binding.pry
    @shipping = Shipping.create(shipping_params)
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

  def purchase
    #購入
  end

  private
  def set_item
    #itemのidを持ってくる
    @item = Item.includes(:images).find(params[:id])
  end
  
  def shipping_params
    #出品itemのparams
    params.require(:shipping).permit(:cost_burden, :period_before_shipping, :prefecure,
    items_attributes: [:name, :body, :status, :order_status, :price, :condition, images_attributes: [:url])
  end
  def exihibited_lists
      @items = Item.where(user_id: cuuret_user)
  end

  def exihibited
    @item = Item.find(params[:id])
  end
end