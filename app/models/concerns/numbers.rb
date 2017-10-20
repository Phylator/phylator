module Numbers

    extend ActiveSupport::Concern

    include ActionView::Helpers::NumberHelper

    def trim num
        i, f = num.to_i, num.to_f
        i == f ? i : f
    end

    def delimiter num
        number_with_delimiter num
    end

    def decimals a
        num = 0
        while a != a.to_i
            num += 1
            a *= 10
        end
        num
    end

end
