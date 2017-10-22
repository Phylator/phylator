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
        x = self.margin_of_error.to_s
        if x.size > 12
            if x[1] == '.'
                '%.10f' % x
            else
                trim(self.margin_of_error).to_s
            end
        else
            delimiter(trim(self.margin_of_error))
        end
    end

    def margin_of_error_decimals
        decimals self.margin_of_error
    end

end
