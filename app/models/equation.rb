class Equation < ApplicationRecord

    after_create_commit :associate

    acts_as_belonger
    acts_as_belongable
    serialize :conditions, Array
    translates :title, :conditions

    validates :equation, presence: true

    belonger :quantities, 'Quantity'
    belonger :constants, 'Constant'

    belongs_to :quantity
    belongable :calculations, 'Calculation', scope: :dependency
    belongable :excluded_from_calculations, 'Calculation', scope: :exclude

    def pure_equation
        self.equation.tr "'", ''
    end

    private

    def associate
        calculator = ::Dentaku::Calculator.new case_sensitive: true
        symbols = calculator.dependencies self.pure_equation
        Quantity.all.each do |quantity|
            self.add_belongable! quantity if symbols.include? quantity.pure_sym
        end
        Constant.all.each do |constant|
            self.add_belongable! constant if symbols.include? constant.pure_sym
        end
    end

end
