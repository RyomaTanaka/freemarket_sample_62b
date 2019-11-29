class ItemsController < ApplicationController
  require 'payjp'
  
  before_action :exihibited, except: [:index, :new, :create]
  before_action :set_card, only: [:purchase_confirmation, :purchase_complete]

  def index
    @items = Item.all.limit(10).order("created_at DESC")
  end

  def show
    user = @item.user
    @items = user.items.all.where.not(id: @item.id).limit(6).order("created_at DESC")
  end

  def new
    # 商品出品
    @item = Item.new
    image = @item.images.build

    #商品カテゴリー
    @category_parent_array = ["---"]
    Categorie.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
      # binding.pry
    end
  end

  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
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


  # def item_params
  #   #出品itemのparams
  #   params.require(:item).permit(:cost_burden, :period_before_shipping, :prefecture, :name, :body, :status, :order_status, :price,
  #   images_attributes: [:image]).merge(user_id: current_user.id)
  # end

  def exihibited_lists
    @items = Item.where(user_id: current_user)

  end

  def exihibited
    # @items = Item.where(user_id: current_user)
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
