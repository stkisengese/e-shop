class ApplicationController < ActionController::Base
  include CurrentCart
  before_action :set_cart
  allow_browser versions: :modern

  # Rescues RecordNotFound and RoutingError globally
  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  rescue_from ActionController::RoutingError, with: :render_404

  def render_404
    logger.error "Routing error: #{request.path} not found."
    respond_to do |format|
      format.html { render template: 'errors/not_found', status: 404 }
      format.all { head :not_found }
    end
  end
end
