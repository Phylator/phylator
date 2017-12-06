class PurchasesController < ApplicationController

    before_action :authenticate_user!

    # POST /purchases
    # POST /purchases.json
    def create
        @purchase = current_user.purchases.build
        @purchase.pack = Pack.friendly.find params[:id]
        description = I18n.t 'payments.create.description', pack: @purchase.pack.name

        begin
            charge = Stripe::Charge.create(
                amount: (@purchase.pack.price * 100).to_i,
                currency: 'usd',
                description: description,
                receipt_email: params[:receipt_email],
                source: params[:token]
            )
        rescue => e
            railse e.inspect
        end

        @purchase.stripe_charge_id = charge[:id]
        @purchase.save!

        @purchase.update_attributes completed: true

        redirect_back fallback_location: root_url, notice: I18n.t('purchases.create.success', pack: @purchase.pack.name)
    end

end
