# frozen_string_literal: true

class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  translates :name, :description

  has_many :packs

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true

  def purchased?(user)
    purchased_packs = 0
    packs.each do |pack|
      purchased_packs += 1 if pack.purchased?(user) || pack.price == 0
    end

    if purchased_packs == packs.count
      0
    elsif purchased_packs > 0
      1
    else
      2
    end
  end
end
