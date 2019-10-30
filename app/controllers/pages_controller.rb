class PagesController < ApplicationController
    def home
        @random_product = Product.order('RANDOM()').first
    end

    def account
        @account = Account.find(params[:id])
    end
end