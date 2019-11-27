class AddressesController < ApplicationController

  def edit    
    @address = Address.find(params[:id])
  end

  def update
  end

end
