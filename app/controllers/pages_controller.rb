class PagesController < ApplicationController
    def home
        @random_product = Product.order('RANDOM()').first
    end
end