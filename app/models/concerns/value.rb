module Value

    extend ActiveSupport::Concern

    include Numbers

    def value
        read_attribute(:value) ? BigDecimal.new(read_attribute(:value)) : nil
    end

    def value= value
        write_attribute :value, value.to_s
    end

    def pretty_value
        if self.value.to_s.size > 12
            x = trim(self.value).to_f.to_s
            x[1] == '.' ? '%.10f' % x : "%e" % x
        else
            delimiter(trim(self.value))
        end
    end

    def value_decimals
        decimals self.value
    end

end
