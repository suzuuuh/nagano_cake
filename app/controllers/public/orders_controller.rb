class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @postage = 800
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @cart_items = current_customer.cart_items
    @total = 0
  end


  def thanks
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save
    flash[:notice] = "You have created book successfully."
    redirect_to order_path
    else
      render :confirm
    end
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
