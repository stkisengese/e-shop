class ProductsController < ApplicationController
  # before_action :set_product, only: %i[ show edit update destroy ]

  #To ensure only logged-in users can access actions other than index and show
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user, only: [:edit, :update, :destroy]
  # GET /products or /products.json
  def index
    @products = Product.all

    # filtering
    @products = @products.by_brand(params[:brand]) if params[:brand].present?

    # If "category" filter is present, search by both title and brand
    if params[:category].present?
      @products = @products.where("title LIKE ? OR brand LIKE ?", "%#{params[:category]}%", "%#{params[:category]}%")
    end
    
    @products = @products.by_condition(params[:condition]) if params[:condition].present?
    @products = @products.price_range(params[:min_price], params[:max_price]) if params[:min_price].present? && params[:max_price].present?

    # Order products by creation date (newest first)
    @products = @products.order(created_at: :desc)
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    # @product = Product.new
    @product = current_user.products.build
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    # @product = Product.new(product_params)
    @product = current_user.products.build(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy!

    respond_to do |format|
      format.html { redirect_to products_path, status: :see_other, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.expect(product: [ :title, :price, :model, :description, :brand, :color, :condition, :image])
  end

  def authorize_user
    unless @product.user == current_user
      redirect_to products_path, alert: "You are not authorized to perform this action."
    end
  end
end
