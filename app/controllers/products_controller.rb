class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    p "1111111111111111111111111111111111111111111111111111111111111111111111"
    p params.inspect
    @product = Product.create!(
      title:    params[:product][:title],
      body:     params[:product][:body],
      location: params[:product][:location],
      category: params[:product][:category],
      price:    params[:product][:price],
      quantity: params[:product][:quantity]
      )

    # if @product.save
      redirect_to products_path,  :notice => "Your product was saved"
    # else
    #   render "new"
    # end
  end

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