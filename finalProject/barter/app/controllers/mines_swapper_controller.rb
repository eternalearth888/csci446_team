class MinesSwapperController < ApplicationController
  def index
  	@items = Item.order(:title)
  end
end
