class ShopsController < ApplicationController
  before_action :authenticate, except:[:index, :show]
  before_action :load_shop, except: [:index, :new, :create]
  
  def index
    @shops = Shop.all
  end
  
  def new
    @shop = Shop.new
  end
  
  def create
    @shop = Shop.new shop_params
    @shop.user = current_user
    if @shop.save
      redirect_to shops_path, notice: "Product Posted."
    else
      render :new
    end
  end
  
  def show
    @request = Request.new
  end
  
  def edit
  end
  
  def update
    if @shop.update shop_params
      redirect_to @shop, notice: "Product is updated."
    else 
      render :edit
    end
  end
  
  def destroy
    @shop.destroy
    redirect_to shops_path, alert: "Product is deleted."
  end
  
  private
  
  def load_shop
    @shop = Shop.find params[:id]
  end
  
  def shop_params
    params.require(:shop).permit(:product_name,:price,:quantity,:information, :productImage, :rating)
  end
end
