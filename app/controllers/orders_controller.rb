class OrdersController < ApplicationController
  def index
    @dessert = Dessert.find(params[:dessert_id])
    @orders = @dessert.orders
  end

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
    @dessert = Dessert.find(params[:dessert_id])
    @order = Order.find(params[:id])
    @order.update(order_params)
    flash[:notice] = "訂單狀態更新成功"
    redirect_to dessert_orders_path(@dessert)
  end

  def checkout_spgateway
    @order = current_user.orders.find(params[:id])
    if @order.payment_status != "not_paid"
      flash[:alert] = "Order has been paid."
      redirect_to orders_path
    else
      @payment = Payment.create!(
        sn: Time.now.to_i,
        order_id: @order.id,
        amount: @order.order_price
      )

      # get params string
      #spgateway_data = {
      #  MerchantID: "MS35081680",
      #  Version: 1.4,
      #  RespondType: "JSON",
      #  TimeStamp: Time.now.to_i,
      #  MerchantOrderNo: "#{Time.now.to_i}",
      #  Amt: @order.order_price,
      #  ItemDesc: @order.name,
      #  ReturnURL: spgateway_return_url,
      #  Email: @order.user.email,
      #  LoginType: 0
      #}.to_query
      spgateway_data = Spgateway.new(@payment).generate_form_data(spgateway_return_url)

      # AES encrypt
      hash_key = "zkn80MmVP0h9sC4V3eyN54W0QxFUYNxP"
      hash_iv = "du0Zeee6uaFZGZuL"

      cipher = OpenSSL::Cipher::AES256.new(:CBC)
      cipher.encrypt
      cipher.key = hash_key
      cipher.iv  = hash_iv
      encrypted = cipher.update(spgateway_data) + cipher.final
      aes = encrypted.unpack('H*').first    # binary 轉 hex

      # SHA256
      str = "HashKey=#{hash_key}&#{aes}&HashIV=#{hash_iv}"
      sha = Digest::SHA256.hexdigest(str).upcase

      # set form instance variable
      @merchant_id = "MS35081680"
      @trade_info = aes
      @trade_sha = sha
      @version = "1.4"

      render layout: false
    end
  end

  private

  def order_params
    params.require(:order).permit(:amount, :name, :phone, :user_id, :dessert_id, :seller_id, :message, :shipping_status)
  end
end
