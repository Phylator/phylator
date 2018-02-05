class PurchasesController < ApplicationController

    before_action :authenticate_user!

    # POST /purchases
    # POST /purchases.json
    def create
        @purchase = current_user.purchases.build
        @purchase.pack = Pack.friendly.find params[:id]
        @purchase.amount = @purchase.pack.price
        description = I18n.t 'payments.create.description', pack: @purchase.pack.name

        charge = Stripe::Charge.create(
            amount: (@purchase.pack.price * 100).to_i,
            currency: 'usd',
            description: description,
            receipt_email: params[:receipt_email],
            source: params[:token]
        )

        @purchase.stripe_charge_id = charge[:id]
        @purchase.completed = true
        @purchase.save!

        notification = Notification.create target: current_user, metadata: {
            onesignal_contents: {
                en: I18n.t('purchases.create.success', pack: @purchase.pack.name),
                de: I18n.t('purchases.create.success', pack: @purchase.pack.name, locale: :de)
            }
        }
        notification.push :OneSignal, player_ids: notification.target.onesignal_player_ids

        redirect_to @purchase.pack, notice: I18n.t('purchases.create.success', pack: @purchase.pack.name)
    end

end
