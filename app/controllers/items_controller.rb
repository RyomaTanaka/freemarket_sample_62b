class ItemsController < ApplicationController

  def index
    @items = Item.all.limit(10).order("created_at DESC")
    @q = Item.ransack(params[:q])
    @itemsResult = @q.result.includes(:images, :users)
  end
    
  def item_search
    @q = Item.ransack(search_params)
    @itemsResult = @q.result.includes(:images)
    @item = Item.find(params[:id])
    user = @item.user
    @items = user.items.all.limit(6).order("created_at DESC")
    
  end


  def show
    @item = Item.find(params[:id])
    user = @item.user
    @items = user.items.all.limit(6).order("created_at DESC")
  end

  def new
    # 商品出品
    @item = Item.new
    image = @item.images.build
    

    #商品カテゴリー
    @category_parent_array = ["---"]
    # Categorie.where(ancestry: nil).each do |parent| 実装途中のためコメントアウト残してます
    #   @category_parent_array << parent.name
    # end
  end


  def create
    
    @item = Item.create(item_params)
    
    
      redirect_to action: :index
  end



  def edit
  
  end

  def update
    if @item.update(update_item_params)
      redirect_to root_path
    else
      redirect_to edit_item_path
    end
  end

  def destroy
    
  end

  def purchase
    #購入
  end

  def purchase_complete
    @item = Item.find(params[:id])
    
  end

  def item_search

  end


  private
  def set_item
    #itemのidを持ってくる
    @item = Item.includes(:images).find(params[:id])
  end
  
  def item_params
    #出品itemのparams
    params.require(:item).permit(:cost_burden, :period_before_shipping, :prefecture_id, :name, :body, :status, :order_status, :price, :shipping_method,
    images_attributes: [:image]).merge(user_id: current_user.id)
  end
  
  def exihibited_lists
      @items = Item.where(user_id: current_user)
  end

  def exihibited
    @item = Item.find(params[:id])
  end

  def search_params
    params.require(:q).permit!
  end
end