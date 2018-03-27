class QuantitiesController < ApplicationController

    before_action :authenticate_user!
    before_action :set_quantity, only: [:show]

    def index
        turbolinks_animate 'fadein'
        @quantities = (current_user ? Quantity.with_translations(I18n.locale).free + current_user.quantities.with_translations(I18n.locale) : Quantity.with_translations(I18n.locale).free).sort_by { |obj| obj.name }
        @constants = (current_user ? Constant.with_translations(I18n.locale).free + current_user.constants.with_translations(I18n.locale) : Constant.with_translations(I18n.locale).free).sort_by { |obj| obj.name }
        authorizes! :read, @quantities
        render layout: 'app'
    end

    def show
        turbolinks_animate 'fadeinright'
        @equations = @quantity.equations.with_translations(I18n.locale).group_by { |e| e.title }
        @quantities = @quantity.child_quantities.with_translations(I18n.locale).order(:name)
        @unit_of_measurements = @quantity.unit_of_measurements.with_translations(I18n.locale).order(base: :desc)
        @calculations = @quantity.calculations.where(user: current_user).order('created_at desc')
        authorize! :read, @quantity
        # authorizes! :read, @equations
        authorizes! :read, @calculations
        render layout: 'app/show'
    end

    private

    def set_quantity
        @quantity = Quantity.friendly.find params[:id]
    end

end
