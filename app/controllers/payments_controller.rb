class PaymentsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:webhook]

    def success
        #   Finds the last purchase by user to display a successful purchase - (definitely not the most ideal method!)
        @purchase = Payment.where(user_id: current_user.id).last
        @product = Product.find(@purchase.product_id)

    end

    def webhook
        #   Collect required variables
        payment_id= params[:data][:object][:payment_intent]
        payment = Stripe::PaymentIntent.retrieve(payment_id)
        listing_id = payment.metadata.listing_id
        user_id = payment.metadata.user_id

        #   Create listing in our Payment table
        trans = Payment.create(
            user_id: user_id,
            product_id: listing_id,
            stripe_transaction_id: payment_id
        )

        # Here we update the purchase status boolean on our product to true, so that it no longer displays in Index
        # and can be seen as a sold product in our Account.
        purchase_status = Product.find(listing_id)
        purchase_status.update(purchased: true)
        purchase_status.save

        unless trans
            link_to # STATIC FAILED TRANS PAGE
        end
    end
end