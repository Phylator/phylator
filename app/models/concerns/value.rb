# frozen_string_literal: true

module Value
  extend ActiveSupport::Concern

  include Numbers

  def value
    read_attribute(:value) ? BigDecimal.new(read_attribute(:value)) : nil
  end

  def value=(value)
    write_attribute(:value, value.to_s)
  end

  def pretty_value
    x = value.to_s
    if x.size > 12
      "%g" % ( "%E" % x )
    else
      delimiter(trim(value))
    end
  end

  def value_decimals
    decimals(value)
  end
end
