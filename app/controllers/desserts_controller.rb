class DessertsController < ApplicationController

  def index #前台首頁
    @desserts = Dessert.all
  end

end
