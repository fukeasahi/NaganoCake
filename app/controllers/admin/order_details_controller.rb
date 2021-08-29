class Admin::OrderDetailsController < ApplicationController

  def update
  	@order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    @order = @order_detail.order
    @order_details = @order.order_details
    # binding.pry
    if params[:order_detail][:production_status] == '製作中'
  		# binding.pry
       @order.update(status: '製作中')
    else 
    	  seisakukanryou = 0
		    @order_details.each do |order_detail|
		    # (一つの製作ステータスが `製作完了`か確認をする。そうだったら変数の数字を+1する。)
		     # binding.pry
			    if order_detail.production_status == '製作完了'
			      seisakukanryou += 1
			    end
			end

			if seisakukanryou == @order_details.count
			    @order.update(status: '発送準備中')
			  # (製作完了だった個数が注文詳細の数と一致していたら注文ステータスを `発送準備中` にする)
			end
  	end
    redirect_to admin_order_path(@order)
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end
end


