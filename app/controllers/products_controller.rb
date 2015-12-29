class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.create!(
      title:    params[:title],
      body:     params[:body],
      location: params[:location],
      category: params[:category],
      price:    params[:price],
      quantity: params[:quantity]
      )
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
      title:    params[:product][:title],
      body:     params[:product][:body],
      location: params[:product][:location],
      category: params[:product][:category],
      price:    params[:product][:price],
      quantity: params[:product][:quantity]
      )
    redirect_to products_path
  end

end
