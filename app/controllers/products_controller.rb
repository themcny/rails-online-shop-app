class ProductsController < ApplicationController

  def index
    @products = Product.where(nil)
    @products.each do |product|
      if product.quantity <= 0
        product.update_attributes(location: "Out-Of-Stock")
      elsif product.expiration_date < DateTime.now.utc
        product.update_attributes(location: "Expired")
      end
    end
    @products = @products.location(params[:location]) if params[:location].present?
    @products = @products.expiration_date(params[:expiration_date]) if params[:expiration_date].present?
    @products = @products.cheap_price(params[:cheap_price].to_i) if params[:cheap_price].present?
  end

  def new
    if current_user && current_user.admin
      @product = Product.new
    else
      redirect_to products_path
    end
  end

  def create
    if current_user && current_user.admin
      @product = Product.new(product_params)
      if @product.save
        redirect_to products_path,  :notice => "Your product was saved"
      else
        render "new"
      end
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def destroy
    if current_user && current_user.admin
      @product = Product.find(params[:id])
      @product.destroy
      redirect_to products_path
    end
  end

  def edit
    if current_user && current_user.admin
      @product = Product.find(params[:id])
    else
      redirect_to products_path
    end
  end

  def update
    if current_user && current_user.admin
      @product = Product.find(params[:id])
      @product.assign_attributes(product_params)
      if @product.save
        redirect_to products_path
      else
        render 'edit'
      end
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :body, :location, :category, :price, :quantity, :expiration_date, :product_img)
  end

end
