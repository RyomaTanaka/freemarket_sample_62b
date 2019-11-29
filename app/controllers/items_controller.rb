class ItemsController < ApplicationController
  require 'payjp'

  before_action :exihibited, except: [:index, :new, :create]
  before_action :set_card, only: [:purchase_confirmation, :purchase_complete]

  def index

    @items = Item.includes(:images).limit(10).order("created_at DESC")
    @images = Image.all

  end

  def show
    user = @item.user
    @items = user.items.all.where.not(id: @item.id).limit(6).order("created_at DESC")
  end

  def new
    @item = Item.new
    image = @item.images.build

    @category_parent_array = ["---"]
  end

  def create

    @item = Item.new(item_params)
    if @item.save
      redirect_to action: :index
    else
      redirect_to action: :new
    end

  end

  def edit
    @item = Item.find(params[:id])

  end

  def update

    @item = Item.find(params[:id])
    @item.update(item_params)

    redirect_to list_items_mypage_path, notice: '編集しました'
  end

  def destroy

  @item = Item.find(params[:id])
    if @item = Item.find(params[:id])
    @item.destroy
    redirect_to list_items_mypage_path, notice: '削除しました'

    end
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

    @item = Item.includes(:images).find(params[:id])
  end

  def item_params

    params.require(:item).permit(:cost_burden, :period_before_shipping, :prefecture_id, :name, :body, :status, :order_status, :price, :shipping_method,
    images_attributes: [:image]).merge(user_id: current_user.id)

  end

  def exihibited_lists
    @items = Item.where(user_id: current_user)

  end

  def exihibited

    @item = Item.find(params[:id])

  end

  def set_item
    @item = Item.includes(:images).find(params[:id])
  end

  def set_card
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    customer = Payjp::Customer.retrieve(current_user.card.customer_id)
    @user_card = customer.cards.retrieve(current_user.card.card_id)
  end
end
