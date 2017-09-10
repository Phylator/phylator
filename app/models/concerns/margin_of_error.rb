module MarginOfError

    extend ActiveSupport::Concern

    def margin_of_error
        read_attribute(:margin_of_error) ? BigDecimal.new(read_attribute(:margin_of_error)) : nil
    end

    def margin_of_error= margin_of_error
        write_attribute :margin_of_error, margin_of_error.to_s
    end

end
