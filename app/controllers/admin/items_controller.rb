class Admin::ItemsController < ApplicationController
  def index
  end

  def edit
  end

  def new
    
  end

  def show
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name,:introduction,:price,:image)
  end
end
