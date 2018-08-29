# frozen_string_literal: true

class Convert
  def initialize(value, from: nil, to: nil)
    @calculator = Dentaku::Calculator.new
    @value = value
    @from = from
    @to = to
  end

  def perform
    @calculator.evaluate(operation)
  end

  private

  def operation
    "#{@value}#{to_base}#{from_base}"
  end

  def to_base
    @from&.to_base
  end

  def from_base
    @to&.from_base
  end
end
