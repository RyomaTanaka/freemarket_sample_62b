class ItemsController < ApplicationController
  require 'payjp'
  before_action :exihibited, except: [:index, :new]
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
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    charge = Payjp::Charge.create(
      amount: @item.price,
      customer: current_user.card.customer_id,
      currency: 'jpy',
    )

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