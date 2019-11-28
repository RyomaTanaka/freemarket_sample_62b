class ItemsController < ApplicationController
  require 'payjp'
  
  before_action :exihibited, except: [:index, :new, :create]
  before_action :set_card, only: [:purchase_confirmation, :purchase_complete]

  def index
    @items = Item.all.limit(10).order("created_at DESC")
  end
    
  def show
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
    @item = Item.find(params[:id])

  end

  def update

    @item = Item.find(params[:id])
    @item.update(item_params)
    
    redirect_to list_items_mypage_path, notice: '編集しました'
  end


    # if @item.update(item_params)
    #   redirect_to root_path
    # else
    #   redirect_to edit_item_path
    # end


  def destroy

  @item = Item.find(params[:id])
  if @item = Item.find(params[:id])
    @item.destroy
    redirect_to list_items_mypage_path, notice: '削除しました'

  end


  def purchase
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    charge = Payjp::Charge.create(
      amount: @item.price,
      customer: current_user.card.customer_id,
      currency: 'jpy',
    )
    @item.update(order_status: 1)
    redirect_to purchase_complete_item_path(@item)
  end

  def purchase_confirmation
  end
  
  def purchase_complete
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

  def set_card
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    customer = Payjp::Customer.retrieve(current_user.card.customer_id)
    @user_card = customer.cards.retrieve(current_user.card.card_id)
  end
end