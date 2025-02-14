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
      redirect_to root_path, notice: "Cart emptied."
    end

    def update_quantity
      product = Product.find(params[:product_id])
      case params[:change]
      when 'increase'
        @cart.add_item(product)
      when 'decrease'
        @cart.decrease_quantity(product)
      end
      
      respond_to do |format|
        format.html { redirect_to cart_path, notice: 'Cart updated' }
        format.turbo_stream
      end
  end