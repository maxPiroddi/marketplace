class PagesController < ApplicationController

    def home
        @random_product = Product.order('RANDOM()').first
    end

    def account
        @account = current_user
        # purchase_history = Payment.where(user_id: current_user).product_id
        # purchased_items = 
    end
end