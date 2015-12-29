class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def create
    @product = Product.new(params[:stuff])
    @product.save
  end

  def show
    @product = Product.find(params[:id])
  end

  def delete
    @product = Product.find(params[:id])
    @product.destroy
  end
end
