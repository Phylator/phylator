# frozen_string_literal: true

class Charge
  def initialize(user:, pack:, token:, email: nil)
    @user = user
    @pack = pack
    @token = token
    @email = email
  end

  def perform
    purchase = Purchase.new(user: @user, pack: @pack, amount: @pack.price)
    purchase.stripe_charge_id = charge[:id]
    purchase.completed = true
    purchase.save!
    purchase
  end

  private

  def charge
    Stripe::Charge.create(
      amount: amount,
      currency: 'usd',
      description: description,
      receipt_email: email,
      source: @token
    )
  end

  def amount
    (@pack.price * 100).to_i
  end

  def description
    I18n.t('purchases.create.description', category: @pack.category,
                                           pack: @pack.name)
  end

  def email
    @email || @user.email
  end
end
