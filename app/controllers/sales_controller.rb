class SalesController < ApplicationController
  def new
    @sale = Sale.new
  end
  
  def create
    
    @value = sale_params[:value].to_i
    @discount = sale_params[:discount].to_i / 100
    Sale.create(sale_params)

    # @sale[:value] *= @sale[:discount] / 100
  end

  def sale_params
    params.require(:sale).permit(:cod, :detail, :category, :value, :discount, :tax, :total)
  end
end
