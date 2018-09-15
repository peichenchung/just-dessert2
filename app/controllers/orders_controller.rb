class OrdersController < ApplicationController
  def new
    @dessert = Dessert.find(params[:dessert_id])
    @order = Order.new
  end

  def create
    @dessert = Dessert.find(params[:dessert_id])
    @order = @dessert.orders.build(order_params)
    @order.dessert_id = @dessert.id
    @order.user = current_user
    @order.save!
    redirect_to dessert_path(@dessert)
  end

  private

  def order_params
    params.require(:order).permit(:amount, :name, :phone, :user_id, :dessert_id)
  end
end
