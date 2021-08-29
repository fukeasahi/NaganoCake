class Public::CartItemsController < ApplicationController

  def index
  	@cart_items = CartItem.all
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = CartItem.all
    @cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    # binding.pry
    @cart_item.end_user_id = current_end_user.id
    if current_end_user.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      @exist_cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id])
      @exist_cart_item.update(amount: @exist_cart_item.amount + params[:cart_item][:amount].to_i)
    else
       @cart_item.save
    end
     redirect_to cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id)
  end
end
