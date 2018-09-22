class CategoriesController < ApplicationController
  def show
    @categories = Category.all
    @category = Category.find(params[:id])
    @desserts = @category.desserts.page(params[:page]).per(9)
  end
end
