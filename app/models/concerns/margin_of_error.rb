module MarginOfError

    extend ActiveSupport::Concern

    include Numbers

    def margin_of_error
        read_attribute(:margin_of_error) ? BigDecimal.new(read_attribute(:margin_of_error)) : nil
    end

    def margin_of_error= margin_of_error
        write_attribute :margin_of_error, margin_of_error.to_s
    end

    def pretty_margin_of_error
        if self.margin_of_error.to_s.size > 12
            x = trim(self.margin_of_error).to_f.to_s
            # x[1] == '.' ? x : "%e" % x
            "%e" % x
        else
            delimiter(trim(self.margin_of_error))
        end
    end

    def margin_of_error_decimals
        decimals self.margin_of_error
    end

end
