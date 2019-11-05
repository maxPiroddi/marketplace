class PagesController < ApplicationController

    def home
        @random_product = Product.order('RANDOM()').first

        if params[:q]
            @products = Product.where("category_id = ?", "%#{params[:q]}%")
        end
    end

    def account
        @account = current_user
        
        @purchase = current_user.payments
    end
end