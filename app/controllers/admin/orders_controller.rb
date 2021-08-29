class Admin::OrdersController < ApplicationController

  def index
   @orders = Order.all
  end

  def show
  	@order = Order.find(params[:id])
    @order_details = @order.order_details

    @sum = 0
    @order_details.each do |order_detail|
      @sum += (order_detail.unitprice * 1.1).round * order_detail.quantity
    end
    @sum
  end

  def update
  	@order = Order.find(params[:id])
    @order_details = @order.order_details
    if params[:order][:status] == '入金確認'
        @order_details.each do |order_detail|
          order_detail.update(production_status: '製作待ち')
        end
    end
    @order.update(order_params)
    redirect_to admin_order_path(@order)
	end

  private
  def order_params
    params.require(:order).permit(:status)
  end

   
end
