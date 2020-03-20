class RequestsController < ApplicationController
  before_action :load_shop
  before_action :load_request, except: [:index, :new, :create]
  
  def index
    @requests = @shop.requests
  end
  
  def new
    @request = Request.new
  end
  
  def create
    @request = Request.new request_params
    if @shop.requests << @request
      redirect_to shop_path(@shop), notice: "Request has been posted."
    else 
      render :new
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @request.update request_params
      redirect_to shop_path(@shop), notice: "Updated"
    else
      render :edit
    end
  end
  
  def destroy
    @request.destroy
    redirect_to shop_path(@shop), alert: "Deleted."
  end
  
  private
  
  def load_shop
    @shop = Shop.find params[:shop_id]
  end

  def request_params
    params.require(:request).permit(:name,:email,:body, :rating)
  end
  
  def load_request
    @request = @shop.requests.find params[:id]
  end
end
