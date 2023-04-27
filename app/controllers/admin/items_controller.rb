class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
    @item = Item.new
  end

  def edit
  end

  def new
    @item = Item.new

  end

  def show
  end

  def create
    @item = Item.new(item_params)
    if @item.save
    flash[:notice] = "You have created book successfully."
    redirect_to admin_item_path(@item.id)
    else
      render :index
    end
  end

  private

  def item_params
    params.require(:item).permit(:name,:introduction,:price,:image)
  end
end
