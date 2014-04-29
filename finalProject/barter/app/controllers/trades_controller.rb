class TradesController < ApplicationController
  before_action :set_trade, only: [:show, :edit, :update, :destroy]
  before_filter :require_login

  # GET /trades
  # GET /trades.json
  def index
    @trades = Trade.all
  end

  # GET /trades/1
  # GET /trades/1.json
  def show
  end

  # GET /trades/new
  def new
    @trade = Trade.new
    @item = Item.find(params[:item_id].to_i)
  end

  # GET /trades/1/edit
  def edit
  end

  # POST /trades
  # POST /trades.json
  def create
    @trade = Trade.new(trade_params)
    @item = Item.find(params[:item_id].to_i)
    @trade.update_attribute(:status, 0)
    @trade.update_attribute(:user1, @item.user_id)
    @trade.update_attribute(:user2, current_user.id)
    @trade.update_attribute(:user1_item, @item.id)

    respond_to do |format|
      if @trade.save
        format.html { redirect_to @trade, notice: 'Trade was successfully created.' }
        format.json { render action: 'show', status: :created, location: @trade }
      else
        format.html { render action: 'new' }
        format.json { render json: @trade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trades/1
  # PATCH/PUT /trades/1.json
  def update

    if update_params[:status].to_i == 1
      Item.find_by_id(@trade.user1_item).update_attribute(:isavailable, false)
      Item.find_by_id(@trade.user2_item).update_attribute(:isavailable, false)
    end
    respond_to do |format|
      if @trade.update(update_params)
        format.html { redirect_to @trade, notice: "Trade was successfully updated."  }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @trade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trades/1
  # DELETE /trades/1.json
  def destroy
    @trade.destroy
    respond_to do |format|
      format.html { redirect_to trades_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trade
			begin 
				@trade = Trade.find(params[:id])
				if params[:item_id] 
					@item = Item.find_by_id(params[:item_id])
				end
			rescue ActiveRecord::RecordNotFound
				redirect_to mines_swapper_url, :notice => "That Trade could not be found"
			end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trade_params
      params.require(:trade).permit(:user1, :user2, :user1_item, :user2_item, :description)
    end

		def update_params
			params.permit(:id, :status)
		end
end
