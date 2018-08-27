# frozen_string_literal: true

module Numbers
  extend ActiveSupport::Concern

  include ActionView::Helpers::NumberHelper

  def trim(num)
    int = num.to_i
    float = num.to_f
    int == float ? int : float
  end

  def delimiter(num)
    number_with_delimiter num
  end

  def decimals(num)
    decimal_places = 0
    while num != num.to_i
      decimal_places += 1
      num *= 10
    end
    decimal_places
  end
end
