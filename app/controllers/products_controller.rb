class ProductsController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_product, only: [:show]
  before_action :set_user_product, only: [:edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = current_user.products.create(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = set_product

    if @product.present?
      @product.destroy
    end

    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Find required product
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust all parameters from the internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :price, :location, :description)
    end

    # Ensure our product belongs to the correct user.
    def set_user_product
        @product = current_user.products.find_by_id(params[:id])

        if @product == nil
            redirect_to products_path
        end
    end
end
