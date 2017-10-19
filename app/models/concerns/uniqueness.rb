module Uniqueness

    extend ActiveSupport::Concern

    included do
        validate :uniqueness_of_record
    end

    private

    def uniqueness_of_record
        if Rails.env == 'production'
            if Quantity.where(symbol: self.symbol).any? || Constant.where(symbol: self.symbol).any?
                errors.add :symbol, 'has already been taken'
            end
        else
            if Quantity.where('BINARY symbol = ?', self.symbol).any? || Constant.where('BINARY symbol = ?', self.symbol).any?
                errors.add :symbol, 'has already been taken'
            end
        end
    end

end
