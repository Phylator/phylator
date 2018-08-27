# frozen_string_literal: true

class Calculate
  class AvailableConstants
    def initialize(user:)
      @user = user
    end

    def perform
      return Constant.free unless @user.present?

      Constant.free + @user.constants
    end
  end
end
