class SalesController < ApplicationController
  def new
    @sale = Sale.new
  end
  
  def create

    value = sale_params[:value].to_i
    discount = sale_params[:discount].to_f / 100
    value_discounted = value * discount
    if sale_params[:tax] == '1'
      value_discounted *= 0.19
      sale_params[:total] = value_discounted
    else
      value
    end

    sale = Sale.new(sale_params)


    if sale.save
      redirect_to root_path, notice: 'Se ha guardado la venta'
    else
      redirect_to root_path, alert: 'No se ha guardado la venta'
    end

    # @sale[:value] *= @sale[:discount] / 100
  end

  def sale_params
    params.require(:sale).permit(:cod, :detail, :category, :value, :discount, :tax, :total)
  end
end
