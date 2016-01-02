class CartsController < ApplicationController
  def show
    if Cart.find(current_user.id)
      current_cart = Cart.find(current_user.id)
      @cart_products = CartProduct.where(owner_id: current_cart.id)
      @product_objects = []
      @cart_products.each do |cart_product|
        @product_objects << Product.find(cart_product.item_id)
      end
    else

    end
  end

  def update
    @cart = Cart.find_or_create_by(id: current_user.id)
    @product = Product.find(params['product']['product_id'])

    if @cart.add(@product, @product.price)
      @product.quantity -= 1
      @product.save
    end

    cart_items = CartProduct.where(owner_id: @cart.id)

    redirect_to carts_show_path
  end

  def destroy
    @cart = Cart.find_or_create_by(id: current_user.id)
    cart_product = CartProduct.find(params[:id])
    @product = Product.find(cart_product.item_id)
    if @cart.remove(@product, 1)
        @product.quantity += 1
        @product.save
    end
    redirect_to products_path
  end

end
