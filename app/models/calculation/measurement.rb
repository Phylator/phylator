class Calculation::Measurement < ApplicationRecord

    self.table_name = 'calculation_measurements'

    before_create :randomize_id
    before_create :defaults
    before_save :re_calc, on: :update

    include Value
    include MarginOfError

    validates :value, presence: true

    belongs_to :calculation, class_name: '::Calculation'
    belongs_to :unit_of_measurement, class_name: '::UnitOfMeasurement'
    belongs_to :quantity, class_name: '::Quantity'

    def trim num
        i, f = num.to_i, num.to_f
        i == f ? i : f
    end

    def pretty_value
        if self.value.to_s.size > 12
            "%e" % trim(self.value).to_s
        else
            trim(self.value).to_s
        end
    end

    def pretty_margin_of_error
        if self.margin_of_error.to_s.size > 12
            "%e" % trim(self.margin_of_error).to_s
        else
            trim(self.margin_of_error).to_s
        end
    end

    private

    def defaults
        self.margin_of_error = BigDecimal.new(0) unless self.margin_of_error.present?
    end

    def re_calc
        self.calculation.calc if self.value_changed? || self.margin_of_error_changed?
    end

    def randomize_id
        begin
            self.id = SecureRandom.random_number 9_223_372_036_854_775_807
        end while self.class.where(id: self.id).exists?
    end

end
