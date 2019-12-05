class AddressesController < ApplicationController


  def edit    
    @address = Address.find(params[:id])
  end

  def update
  end

end


# このコントローラは、個人情報画面で使います。 