class PagesController < ApplicationController
  def home
    #   Pick a random product to suggest to users
    #
    @random_product = Product.order('RANDOM()').first
  end

  def account
    #   Simple variable definitions
    #
    @account = current_user
    @purchase = current_user.payments
  end
end
