class PagesController < ApplicationController

    def home
        @random_product = Product.order('RANDOM()').first
    end

    def account
        @account = current_user
        
        @purchase = current_user.payments
    end
end