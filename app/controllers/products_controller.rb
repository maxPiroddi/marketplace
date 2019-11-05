class ProductsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, only: [:show]
  before_action :set_user_product, only: [:edit, :update, :destroy]

  # GET /products
  def index

    @products = Product.where("purchased = false").order("created_at DESC")


    # S E A R C H  F U N C T I O N

    # limit = 10
    # sort = params[:sort] ? params[:sort] : "created_at DESC"

    # if params[:search] && !params[:search].empty?
    #   @products = Product.where("name LIKE ?", "%#{params[:search]}%").limit(limit)
    # else
    #   @products = Product.all.order("created_at DESC").limit(limit)
    # end

    # @products.order(name: sort.to_sym) if sort
  end
  
  # GET /products/1
  def show

    if user_signed_in? && current_user != @product.user
      seller_postcode = @product.location
      buyer_postcode = current_user.postcode
  
      response = HTTP.headers("AUTH-KEY" => Rails.application.credentials.dig(:auspost, :access_key_id))
                  .get("https://digitalapi.auspost.com.au/postage/parcel/domestic/calculate.json", :params => {:length => "20", :width => "15", :height => "10", :weight => "2", :from_postcode => "#{seller_postcode}", :to_postcode => "#{buyer_postcode}", :service_code => "AUS_PARCEL_REGULAR"})

	    data = JSON.parse(response.body)
      @delivery_cost = data["postage_result"]["total_cost"]
      @delivery_time = data["postage_result"]["delivery_time"]

    @full_cost = @product.price + (@delivery_cost.to_f * 100)
    
    session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        customer_email: current_user.email,
        line_items: [{
            name: @product.name,
            description: @product.description,
            amount: @full_cost.to_i,
            currency: 'aud',
            quantity: 1,
        }],
        payment_intent_data: {
            metadata: {
                user_id: current_user.id,
                listing_id: @product.id
            }
        },
        #?userId=#{current_user.id}&listingId=#{@product.id}"
        success_url: "#{root_url}payments/success",
        cancel_url: "#{root_url}products"
    )

    @session_id = session.id
    end
  end

  # GET /products/new
  def new
    @product = Product.new
    @categories = Category.all
    @conditions = Condition.all
  end

  # GET /products/1/edit
  def edit
    @categories = Category.all
    @conditions = Condition.all
  end

  # POST /products
  def create
    @product = current_user.products.create(product_params)
    @product.location = current_user.postcode
    @product.purchased = false
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /products/1
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /products/1
  def destroy
    @product = set_product

    if @product.present?
      @product.destroy
    end

    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
    end
  end

  private
    # Find required product
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust all parameters from the internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :price, :location, :description, :category_id, :condition_id, :picture)
    end

    # Ensure our product belongs to the correct user.
    def set_user_product
        @product = current_user.products.find_by_id(params[:id])

        if @product == nil
            redirect_to products_path
        end
    end
    

end
