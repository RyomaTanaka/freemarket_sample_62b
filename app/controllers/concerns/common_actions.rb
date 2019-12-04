module CommonActions

  extend ActiveSupport::Concern

  def set_category
    @categories = Categorie.where(params[:id])
    @category_children1 = Categorie.where(ancestry: 1)
    @category_children2 = Categorie.where(ancestry: 200)
    @category_children3 = Categorie.where(ancestry: 346)
    @category_children4 = Categorie.where(ancestry: 481)
    @category_children5 = Categorie.where(ancestry: 625)
    @category_children6 = Categorie.where(ancestry: 685)
    @category_children7 = Categorie.where(ancestry: 798)
    @category_children8 = Categorie.where(ancestry: 898)
    @category_children9 = Categorie.where(ancestry: 984)
    @category_children10 = Categorie.where(ancestry: 1093)
    @category_children11 = Categorie.where(ancestry: 1147)
    @category_children12 = Categorie.where(ancestry: 1207)
    @category_children13 = Categorie.where(ancestry: 1270)
  end
end