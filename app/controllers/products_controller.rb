class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def create
    @product = Product.new(whatever: params[:whatever])
    @product.save
  end

  def show
    @product = Product.find(params[:id])
  end

  def delete
    @product = Product.find(params[:id])
    @product.destroy
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(title: params[:product][:title],body: params[:product][:body])
    redirect_to products_path
  end

end
