# frozen_string_literal: true

class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def create
    pack = Pack.friendly.find(params[:pack])
    Charge.new(
      user: current_user,
      pack: pack,
      token: params[:stripeToken],
      email: params[:receipt_email]
    ).perform
    redirect_to pack, notice: I18n.t('purchases.create.success')
  rescue Stripe::CardError => error
    redirect_to pack, alert: error
  end
end
