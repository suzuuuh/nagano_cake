class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

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
    @order = current_customer.orders.new(order_params)
    @cart_items = current_customer.cart_items
    @order.customer_id = current_customer.id
    @order.postage = 800
    @order.billing_amount = @order.postage + @cart_items.sum(&:subtotal)
    if @order.save
    flash[:notice] = "You have created book successfully."
    redirect_to orders_thanks_path
    else
      render :confirm
    end
  end

  def index
    @order = current_customer.orders
  end

  def show
  end

  private


  def order_params
    params.require(:order).permit(:payment_method, :post_code, :address, :name)
  end


end
