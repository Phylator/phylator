class PurchasesController < ApplicationController

    before_action :authenticate_user!

    def create
        @purchase = current_user.purchases.build
        @purchase.pack = Pack.friendly.find params[:pack]
        @purchase.amount = @purchase.pack.price
        description = I18n.t('purchases.create.description', category: @purchase.pack.category, pack: @purchase.pack.name)

        begin
            charge = Stripe::Charge.create(
                amount: (@purchase.pack.price * 100).to_i,
                currency: 'usd',
                description: description,
                receipt_email: params[:receipt_email],
                source: params[:stripeToken]
            )

            @purchase.stripe_charge_id = charge[:id]
            @purchase.completed = true
            @purchase.save!

            # notification = Notification.create target: current_user, object: @purchase
            # notification[:metadata] = {
            #     onesignal_contents: {
            #         en: I18n.t('purchases.create.success', pack: @purchase.pack.name),
            #         de: I18n.t('purchases.create.success', pack: @purchase.pack.name, locale: :de)
            #     }
            # }
            # notification.save!
            # notification.push :OneSignal, player_ids: notification.target.onesignal_player_ids

            redirect_to @purchase.pack, notice: I18n.t('purchases.create.success')
        rescue Stripe::CardError => e
            redirect_to @purchase.pack, alert: e
        end
    end

end
