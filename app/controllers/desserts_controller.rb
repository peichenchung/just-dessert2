class DessertsController < ApplicationController
  before_action :set_dessert, only: [:show, :edit, :update, :destroy]

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
  end

  def edit
  end

  def update
    if @dessert.update(dessert_params)
      flash[:notice] = "更新成功"
      redirect_to dessert_path(@dessert)
    else
      flash.now[:alert] = "更新失敗"
      render :edit
    end
  end

  def destroy
    @dessert.destroy
    redirect_to root_path
    flash[:alert] = "刪除成功"
  end

  private

  def set_dessert
    @dessert = Dessert.find(params[:id])
  end

  def dessert_params
    params.require(:dessert).permit(
      :name, :price, :amount, :image, :description, :location, 
      :production_time, :excess_time, :pick_time, :user_id
    )
  end

end
