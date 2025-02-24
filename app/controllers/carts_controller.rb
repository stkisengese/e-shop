class CartsController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    # The @cart is already set by the CurrentCart concern
  end

  def add_item
    product = Product.find(params[:product_id])
    @cart.add_product(product)
    redirect_to root_path, notice: "Added to your cart."
  end

  def add_item_cart
    product = Product.find(params[:product_id])
    @cart.add_product(product)
    redirect_to cart_path, notice: "Added to your cart."
  end

  def remove_item
    product = Product.find(params[:product_id])
    @cart.line_items.find_by(product: product).destroy
    redirect_to cart_path, notice: "Removed from your cart."
  end

  def empty_cart
    @cart.line_items.destroy_all
    redirect_to root_path, notice: "Cart emptied."
  end

  def decrease_quantity
    product = Product.find(params[:product_id])
    @cart.decrease_quantity(product)
    redirect_to cart_path, notice: 'Cart updated'
  end
end