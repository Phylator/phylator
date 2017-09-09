module Value

    extend ActiveSupport::Concern

    def value
        read_attribute(:value) ? BigDecimal.new(read_attribute(:value)) : nil
    end

    def value= value
        write_attribute :value, value.to_s
    end

end
