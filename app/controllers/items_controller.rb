class ItemsController < ApplicationController

  def show
  end
  def index
    # トップページ
    @shipping = Shipping.all
    
  end

  def new
    # 商品出品
    @shipping = Shipping.new
    item = @shipping.items.build
    item.images.build

    # @category_parent_array = ["---"]
    # Categorie.where(ancestry: nil).each do |parent|
    #   @category_parent_array << parent.name
    # end
  end

  #親カテゴリが選択された後に動くアクション
  # def categorie_children
  #   #親要素に紐付いた子要素を取得
  #   @categorie_children = Categorie.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  # end

  # #子要素カテゴリが選択されたあとに動くアクション
  # def categorie_grandchildren
  #   #子要素に紐付いた孫要素を取得
  #   @categorie_grandchildren = Categorie.find_by("#{params[:parent_name]}").children
  # end

  def create
    # 出品内容を保存
    @shipping = Shipping.create(shipping_params)
  end

  private
  def shipping_params
    params.require(:shipping).permit(:cost_burden, :period_before_shipping, :prefecure,
    items_attributes: [:name, :body, :status, :price, :condition, images_attributes: [:image]])
  end
end