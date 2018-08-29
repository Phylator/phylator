# frozen_string_literal: true

class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  translates :name, :description

  has_many :packs

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true

  def purchased?(user)
    purchased_packs = purchased_packs_count(user)

    if purchased_packs == packs.count
      0
    elsif purchased_packs.positive?
      1
    else
      2
    end
  end

  private

  def purchased_packs_count(user)
    purchased_packs = 0
    packs.each do |pack|
      next unless pack.purchased?(user) || pack.price.zero?

      purchased_packs += 1
    end
    purchased_packs
  end
end
