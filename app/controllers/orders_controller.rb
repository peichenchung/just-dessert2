class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def new
    @dessert = Dessert.find(params[:dessert_id])
    @order = Order.new
  end

  def create
    @dessert = Dessert.find(params[:dessert_id])
    @order = @dessert.orders.build(order_params)

    if @dessert.amount != 0 && @dessert.amount >= @order.amount
      @order.dessert_id = @dessert.id
      @order.seller_id = @dessert.user_id
      @order.user = current_user
      @order.order_price = @dessert.price * @order.amount
      @order.pick_location = @dessert.location
      
      if @order.save
        flash[:notice] = "訂單成立"
        redirect_to order_path(@order)
      else
        flash.now[:alert] = "訂單失敗"
        render :new
      end
      
      @dessert.amount = @dessert.amount - @order.amount
      @dessert.save

    else
      flash.now[:alert] = "很抱歉數量不足喔!"
      render :new
    end
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    flash[:notice] = "訂單狀態更新成功"
    redirect_to order_list_dessert_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:amount, :name, :phone, :user_id, :dessert_id, :seller_id, :message, :shipping_status)
  end
end
