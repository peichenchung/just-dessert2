class OrdersController < ApplicationController
  def new
    @dessert = Dessert.find(params[:dessert_id])
    @order = Order.new
  end

  def create
    @dessert = Dessert.find(params[:dessert_id])
    @order = Order.new(order_params)
    @order.buyer_id = current_user.id
    if @order.save
      flash[:notice] = "訂單成立"
      redirect_to root_path
    else
      flash.now[:alert] = "訂單失敗"
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:amount, :name, :phone, :buyer_id, :seller_id, :dessert_id)
  end
end
