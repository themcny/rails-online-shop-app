class CartsController < ApplicationController
  def index

  end

  def new

  end

  def create

  end

  def show

  end

  def update

    @cart = Cart.find_or_create_by(id: current_user.id)
    @product = Product.find(params['product']['product_id'])

    p "$ -- $ "
    p @product.quantity

    if @cart.add(@product, @product.price)
      @product.quantity -= 1
      @product.save
    end
    cart_items = CartProduct.where(owner_id: @cart.id)

    p "After %%" * 100
    p @product.quantity


    redirect_to products_path
  end

end
