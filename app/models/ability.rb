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
            true
        end
        ## Constants
        can :read, Constant do |constant|
            true
        end

        # Categories & Packs
        can :read, Category
        can :read, Pack

    end

end
