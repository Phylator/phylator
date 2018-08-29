# frozen_string_literal: true

class Calculate
  class AvailableEquations
    def initialize(user:)
      @user = user
    end

    def perform
      return Equation.free unless @user.present?

      Equation.free + @user.equations
    end
  end
end
