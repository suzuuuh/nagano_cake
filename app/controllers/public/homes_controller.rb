class Public::HomesController < ApplicationController
  before_action :authenticate_customer!, except: [:top, :about]
  def top
    #@items = Item.page(params[:page])
    @items = Item.limit(4).order(created_at: :desc)
  end

  def about

  end


end
