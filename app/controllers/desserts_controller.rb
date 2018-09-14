class DessertsController < ApplicationController

  def index #前台首頁
    @desserts = Dessert.all
  end

  def new
    @dessert = Dessert.new
  end

end
