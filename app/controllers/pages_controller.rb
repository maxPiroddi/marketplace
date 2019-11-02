class PagesController < ApplicationController
    before_action :set_user, only: [:account]

    def home
        @random_product = Product.order('RANDOM()').first
    end

    def account
    end

    private

        def set_user
            @user_account = User.find(params[:id])
        end
end