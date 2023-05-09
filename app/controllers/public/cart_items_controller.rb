class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  def index
    #@cart_item = CartItem.find(params[:id])
    @cart_items = current_customer.cart_items
    @cart_item = CartItem.new
    @customer = current_customer
    @total = 0
  end

  def update
    cart_item = CartItem.find(params[:id])
    if cart_item.update!(cart_item_params)
      flash[:notice] = "You have created successfully."
    redirect_to cart_items_path
    else
      render :index
    end
  end

  def destroy
    cart_items = CartItem.find(params[:id])
    cart_items.destroy
    redirect_to cart_items_path
  end

  def all_destroy
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create
    @cart_items = CartItem.all
    @customer = current_customer
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if @cart_item.save
    flash[:notice] = "You have created book successfully."
    redirect_to cart_items_path
    else
      render :index
    end
  end

  private

  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount, :image)
  end

end
