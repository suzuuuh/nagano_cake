class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!, except: [:index]
  
  def index
    @items = Item.page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
  end
end
