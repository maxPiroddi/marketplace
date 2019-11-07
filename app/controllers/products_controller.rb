class ProductsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_product, only: [:show]
  before_action :set_user_product, only: %i[edit update destroy]

  #=======================================================================

  def index
    # Default display if no params are passed. Includes page params for pagination via Kaminari Gem.
    #
    @products = Product.order('created_at desc').where('purchased = false').page params[:page]

    # Search logic -- Here we are searching w/ scopes defined in our method. Each of these allows us to filter what is found.
    #
    @products = @products.search(params[:search]) if params[:search].present?
    if params[:condition_id].present?
      @products = @products.condition_id(params[:condition_id])
    end
    if params[:category_id].present?
      @products = @products.category_id(params[:category_id])
    end
  end

  def show
    # Only run if user is able to purchase item
    if user_signed_in? && current_user != @product.user

      #  Call private method to hit AusPost API
      response = auspost_api_get
      data = JSON.parse(response.body)

      #  Generate variables required for view from API response
      @delivery_cost = data['postage_result']['total_cost']
      @delivery_time = data['postage_result']['delivery_time']

      #  Generate cost of product + shipping for Stripe payment
      @full_cost = @product.price + (@delivery_cost.to_f * 100)

      session = stripe_checkout
      @session_id = session.id
    end
  end

  def new
    #  Set our variables & create new
    @product = Product.new
    @categories = Category.all
    @conditions = Condition.all
  end

  def edit
    #  Set our variables
    @categories = Category.all
    @conditions = Condition.all
  end

  def create
    #  Create product w/ whitelisted params
    @product = current_user.products.create(product_params)

    #  Automatically add users postcode as item location
    @product.location = current_user.postcode

    #  Initialize product purchase status
    @product.purchased = false

    #  Success/failure routing
    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def update
    #  Success/failure routing
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    #  Call method to find product to be destroyed
    @product = set_product

    #  Check we are destroying a real record
    @product.destroy if @product.present?

    redirect_to products_url, notice: 'Product was successfully destroyed.'
  end

  #=======================================================================

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

    redirect_to products_path if @product.nil?
  end

  #  Define buyer/seller locations, submit GET request to AusPost API for shipping costs & time
  def auspost_api_get
    seller_postcode = @product.location
    buyer_postcode = current_user.postcode

    #  Randomised data for API to get more interesting shipping details
    length = rand(5..25)
    width = rand(5..25)
    height = rand(5..25)
    weight = rand(1..10)

    #  AusPost Access KeyID located in Credentials.YML file for security
    response = HTTP.headers('AUTH-KEY' => Rails.application.credentials.dig(:auspost, :access_key_id))
                   .get('https://digitalapi.auspost.com.au/postage/parcel/domestic/calculate.json', params: {
                          length: length.to_s,
                          width: width.to_s,
                          height: height.to_s,
                          weight: weight.to_s,
                          from_postcode: seller_postcode.to_s,
                          to_postcode: buyer_postcode.to_s,
                          service_code: 'AUS_PARCEL_REGULAR'
                        })
  end

  #  Session creation & storage
  def stripe_checkout
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: current_user.email,
      line_items: [{
        name: @product.name,
        description: @product.description,
        amount: @full_cost.to_i,
        currency: 'aud',
        quantity: 1
      }],
      payment_intent_data: {
        metadata: {
          user_id: current_user.id,
          listing_id: @product.id
        }
      },
      success_url: "#{root_url}payments/success",
      cancel_url: "#{root_url}products"
    )
  end
end
