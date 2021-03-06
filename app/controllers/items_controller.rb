class ItemsController < ApplicationController
  require 'payjp'
  require 'tempfile'
  before_action :exihibited, except: [:index,:item_search, :new, :create, :edit, :get_category_children, :get_category_grandchildren]
  before_action :set_card, only: [:purchase_confirmation, :purchase_complete]


  def index
    @items = Item.all.order("created_at DESC")
    @items1 = Item.where(categorie_id: 1).order("created_at DESC")
    @items200 = Item.where(categorie_id: 200).order("created_at DESC")
    @items898 = Item.where(categorie_id: 898).order("created_at DESC")
    @items685 = Item.where(categorie_id: 685).order("created_at DESC")
    @q = Item.ransack(params[:q])
    @itemsResult = @q.result.includes(:images, :users)
  end

  def item_search
    @q = Item.ransack(search_params)
    @itemsResult = @q.result.includes(:images)
  end


  def show
    user = @item.user
    @items = user.items.all.where.not(id: @item.id).limit(6).order("created_at DESC")
  end

  def new
    @item = Item.new
    @item.images.build

    #商品カテゴリー
    @category_parent_array = ["---"]
    Categorie.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      params[:images][:image].each do |image|
        @item.images.create!(image: image, item_id: @item.id)
      end
      redirect_to root_path
    else
      @item.images.build
      render action: :new
    end
  end

  def edit
    @item = Item.find(params[:id])
    
    gon.item = @item
    gon.item_images = @item.images
    gon.item_images_binary_datas = []

    require 'base64'
    require 'aws-sdk'

    if Rails.env.production?
      client = Aws::S3::Client.new(
                             region: 'ap-northeast-1',
                             access_key_id: ENV["AWS_ACCESS_KEY_ID"],
                             secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
                             )
      @item.images.each do |image|
        binary_data = client.get_object(bucket: 'freemarket-sample-62b', key: image.image.file.path).body.read
        gon.item_images_binary_datas << Base64.strict_encode64(binary_data)
      end
    else
      @item.images.each do |image|
        binary_data = File.read(image.image.file.file)
        gon.item_images_binary_datas << Base64.strict_encode64(binary_data)
      end
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    @item.images.destroy_all

    if params[:images]
      params[:image_already].each do |binary|
        bin = Base64.decode64(binary)
        file = Tempfile.new('img')
        file.binmode
        file << bin
        file.rewind
        params[:images][:image] << file
      end
      params[:images][:image].each do |image|
        @item.images.create!(image: image, item_id: @item.id)
      end
    else
      params[:image_already].each do |binary|
        bin = Base64.decode64(binary)
        file = Tempfile.new('img')
        file.binmode
        file << bin
        file.rewind
        @item.images.create!(image: file, item_id: @item.id)
      end
    end

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

  def item_search

  end

  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Categorie.find_by(id: "#{params[:parent_id]}", ancestry: nil).children
  end

  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Categorie.find_by(id: "#{params[:child_id]}").children
  end

  private

  def set_item
    #itemのidを持ってくる
    @item = Item.includes(:images).find(params[:id])
  end

  def item_params
    #出品itemのparams
    params.require(:item).permit(:cost_burden, :period_before_shipping, :prefecture_id, :name, :body, :status, :order_status, :price, :shipping_method, :categorie_id).merge(user_id: current_user.id)
    # params.require(:item).permit(:cost_burden, :period_before_shipping, :prefecture_id, :name, :body, :status, :order_status, :price, :shipping_method,
    # images_attributes: [:image]).merge(user_id: current_user.id)
  end

  def search_params
    params.require(:q).permit!
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