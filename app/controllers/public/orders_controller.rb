class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    @total = 0
  end


  def thanks
  end

  def create
  end

  def index
  end

  def show
  end

  private


  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end

end
