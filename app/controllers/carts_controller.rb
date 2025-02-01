class CartsController < ApplicationController
    before_action :authenticate_user!, only: [:show]
  
    def show
      # The @cart is already set by the CurrentCart concern
    end
  
    def add_item
      product = Product.find(params[:product_id])
      @cart.add_product(product)
      redirect_to cart_path, notice: "Product added to cart."
    end
  
    def remove_item
      product = Product.find(params[:product_id])
      @cart.line_items.find_by(product: product).destroy
      redirect_to cart_path, notice: "Product removed from cart."
    end
  
    def empty_cart
      @cart.line_items.destroy_all
      redirect_to cart_path, notice: "Cart emptied."
    end
  end