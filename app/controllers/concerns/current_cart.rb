module CurrentCart
  extend ActiveSupport::Concern

  included do
    before_action :set_cart
  end

  private

  def set_cart
    if user_signed_in?
      # If the user is signed in, use their cart or create one
      @cart = current_user.cart || current_user.create_cart

      # If there's a session-based cart, transfer items to the user cart
      if session[:cart_id] && current_user.cart != Cart.find(session[:cart_id])
        guest_cart = Cart.find(session[:cart_id])

        # Transfer line items from guest cart to user cart
        guest_cart.line_items.each do |item|
          @cart.add_product(item.product)
        end

        guest_cart.destroy # Delete the guest cart
        session.delete(:cart_id) # Clear session cart ID
      end
    else
      # If the user is a guest, use the session cart or create one
      @cart = Cart.find_by(id: session[:cart_id]) || Cart.create
      session[:cart_id] = @cart.id
    end
  end
end