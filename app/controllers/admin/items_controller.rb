class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @items = Item.all
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new

  end

  def show
    @item = Item.find(params[:id])
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

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "You have created successfully."
    redirect_to admin_item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :image)
  end
end
