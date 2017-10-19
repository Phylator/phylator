module Numbers

    extend ActiveSupport::Concern

    def trim num
        i, f = num.to_i, num.to_f
        i == f ? i : f
    end

    def delimiter num
        num.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
    end

    def decimals num
        num.to_f.to_s.split('.')&.last.split('e')&.first.size
    end

end
