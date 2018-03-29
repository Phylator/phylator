class Calculation < ApplicationRecord

    before_update :re_calc
    after_create_commit :calc

    include AlgoliaSearch
    acts_as_belonger

    algoliasearch do
        attribute :name, :description
        add_attribute :algolia_quantity
    end
    def algolia_quantity
        self.quantity.name
    end

    validates :measurements, presence: true

    has_one :result, class_name: 'Calculation::Result'
    has_many :measurements, class_name: 'Calculation::Measurement'
    belonger :equations, 'Equation', scope: :dependency
    belonger :missing_equations, 'Equation', scope: :missing
    belonger :constants, 'Constant'

    belongs_to :unit_of_measurement
    belongs_to :quantity
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

end
