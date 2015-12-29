class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new(
      title:    params[:title],
      body:     params[:body],
      location: params[:location],
      category: params[:category],
      price:    params[:price],
      quantity: params[:quantity]
      )
    @product.save
  end

  # def create
  #   @product.save
  # end

  def show
    @product = Product.find(params[:id])
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(
      title: params[:product][:title],
      body:  params[:product][:body]
      )
    redirect_to products_path
  end

end
