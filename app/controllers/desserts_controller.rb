class DessertsController < ApplicationController

  def index #前台首頁
    @desserts = Dessert.all
  end

  def new
    @dessert = Dessert.new
  end

  def create
    @dessert = Dessert.new(dessert_params)
    @dessert.user_id = current_user.id
    if @dessert.save
      flash[:notice] = "成功開始一筆甜點集資"
      redirect_to root_path
    else
      flash.now[:alert] = "建立失敗"
      render :new
    end
  end

  def show
    @dessert = Dessert.find(params[:id])
  end

  private

  def dessert_params
    params.require(:dessert).permit(
      :name, :price, :amount, :image, :description, :location, 
      :production_time, :excess_time, :pick_time, :user_id
    )
  end

end
