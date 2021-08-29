class Admin::ItemsController < ApplicationController
  def new
  	@item = Item.new
    @genre = Genre.all

  end

  def create
  	@item = Item.new(item_params)
  	@item.save
  	redirect_to admin_item_path(@item)
  end

  def index
    @items = Item.all
    @item = Item.search(params[:search])
  end

  def show
  end

  def edit
  end

  def search
    #Viewのformで取得したパラメータをモデルに渡す
    
  end

  private
	def item_params
	  params.require(:item).permit(:image, :name, :description, :price, :sales_status, :genre_id)
	end
end
