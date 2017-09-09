class Ability

    include CanCan::Ability

    def initialize user

        user ||= User.new

        # Calculations
        can :manage, Calculation, user_id: user.id
        can [:read, :create], Calculation, public: true
        ## Measurements
        can :manage, Calculation::Measurement do |measurement|
            measurement.calculation.user_id == user.id ? true : false
        end
        can [:read, :create], Calculation::Measurement do |measurement|
            measurement.calculation.public
        end

    end

end
