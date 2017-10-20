class Calculation < ApplicationRecord

    before_create :randomize_id
    after_create_commit :calc
    before_update :re_calc

    validates :measurements, presence: true

    has_one :result, class_name: 'Calculation::Result'
    has_many :measurements, class_name: 'Calculation::Measurement'

    has_many :calculation_equations, class_name: 'Equation', source: :equations, dependent: :destroy
    has_many :equations, through: :calculation_equations

    belongs_to :unit_of_measurement, class_name: '::UnitOfMeasurement'
    belongs_to :quantity, class_name: '::Quantity'
    belongs_to :user, optional: true

    accepts_nested_attributes_for :measurements, reject_if: lambda { |a| a[:value].blank? }, allow_destroy: true

    def calc
        self.result.destroy if self.result
        result = self.build_result
        result.save!
    end

    private

    def re_calc
        self.calc if self.unit_of_measurement_id_changed?
    end

    def randomize_id
        begin
            self.id = SecureRandom.random_number 9_223_372_036_854_775_807
        end while self.class.where(id: self.id).exists?
    end

end
