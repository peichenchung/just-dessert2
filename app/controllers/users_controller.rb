class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
    @desserts = @user.desserts
    @orders = current_user.orders

    # 測試! IG username
    url = "https://api.instagram.com/v1/users/self/?access_token=#{@current_user.ig_token}"
    response = RestClient.get(url)
    data = JSON.parse(response.body)
    data2 = data["data"]
    @username = data2["username"]
  end

  def edit
    unless @user == current_user
      redirect_to user_path(@user)
    end
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :avatar, :intro, :contact_info)
  end
end
