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
      else
        # If the user is a guest, use the session cart or create one
        @cart = Cart.find_by(id: session[:cart_id]) || Cart.create
        session[:cart_id] = @cart.id
      end
    end
  end