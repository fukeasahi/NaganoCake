class Public::OrdersController < ApplicationController
  def new
    cart_items = CartItem.all
    if cart_items.empty?
     redirect_to cart_items_path
    else
       @order = Order.new
    end
  end

  def verification
    @order = Order.new(order_params)
    @cart_items = CartItem.all
    if @cart_items.empty?
        redirect_to cart_items_path
    else
      if  params[:order][:address_option] == "0"
        @order.ship_toaddress = current_end_user.user_address
        @order.ship_name = current_end_user.last_name + current_end_user.first_name
        @order.ship_postcode = current_end_user.postcode
      elsif params[:order][:address_option] == "1"
        @address = Address.find_by(id: params[:order][:address_id])
        @order.ship_toaddress = @address.address
        @order.ship_name = @address.name
        @order.ship_postcode = @address.postcode
      elsif params[:order][:address_option] == "2"
        @order.ship_toaddress = params[:order][:ship_toaddress]
        @order.ship_name = params[:order][:ship_name]
        @order.ship_postcode = params[:order][:ship_postcode]
      end
    end
  end

  def create
    cart_items = CartItem.all
    if cart_items.empty?
        redirect_to cart_items_path
    else
        @order = Order.new(order_params)
        @order.end_user_id = current_end_user.id
        @cart_items = CartItem.all
        @order.postage = 800


        @sum = 0
        @cart_items.each do |cart_item|
            @sum += (cart_item.item.price * 1.1).round * cart_item.amount
        end
        @sum
        @order.total_due = @sum + 800


        @order.save

        # @order_detail = OrderDetail.new(order_detail_params)
        # @order_detail.save

        order_detail = []
          @order_details = current_end_user.cart_items
            @order_details.each do |i|
              order_detail << @order.order_details.build(item_id: i.item_id, quantity: i.amount, production_status: 1, unitprice: i.item.price)
            end
          OrderDetail.import order_detail

        redirect_to orders_completed_path
    end
  end

  def completed
    cart_items = current_end_user.cart_items
    cart_items.destroy_all
  end

  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :ship_toaddress, :ship_name, :ship_postcode, order_details_attributes: [:quantity])
  end

  # def order_detail_params
  #   params.require(:order_detail).permit(:quantity, :unitprice)
  # end
end






