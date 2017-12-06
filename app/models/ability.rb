class Ability

    include CanCan::Ability

    def initialize user

        user ||= User.new

        # Calculations
        can :manage, Calculation, user_id: user.id
        can [:read, :create], Calculation
        ## Measurements
        can :manage, Calculation::Measurement do |measurement|
            measurement.calculation.user_id == user.id ? true : false
        end
        can [:read, :create], Calculation::Measurement
        ## Quantities
        can :read, Quantity do |quantity|
            true if quantity.pack.price == 0 || quantity.pack.purchases.where(user_id: user.id).any?
        end
        ## Constants
        can :read, Constant do |constant|
            true if constant.pack.price == 0 || constant.pack.purchases.where(user_id: user.id).any?
        end
        ## Units
        can :read, UnitOfMeasurement do |unit_of_measurement|
            unit_of_measurement.quantities.each do |quantity|
                true if quantity.pack.price == 0 || quantity.pack.purchases.where(user_id: user.id).any?
            end
        end
        ## Equations
        can :read, Equation do |equation|
            true if equation.quantity.pack.price == 0 || equation.quantity.pack.purchases.where(user_id: user.id).any?
        end

        # Categories & Packs
        can :read, Category
        can :read, Pack

    end

end
