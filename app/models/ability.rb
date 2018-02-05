class Ability

    include CanCan::Ability
    include CanCanCan::System::Ability

    def initialize user

        user ||= User.new
        modify [:create, :read, :update, :destroy]

        can :read, Category
        can :read, Pack
        can [:read, :create], Calculation
        abilities Calculation, user, public_abilities: false
        can [:read, :create], Calculation::Measurement
        can :manage, Calculation::Measurement do |measurement|
            measurement.calculation.user_id == user.id
        end
        can :read, Quantity do |quantity|
            ( quantity.pack.price == 0 || quantity.pack.purchases.where(user_id: user.id).any? ) && user.id
        end
        can :read, Constant do |constant|
            ( constant.pack.price == 0 || constant.pack.purchases.where(user_id: user.id).any? ) && user.id
        end
        can :read, UnitOfMeasurement do |unit_of_measurement|
            accessible = true
            unit_of_measurement.quantities.each do |quantity|
                accessible = ( quantity.pack.price == 0 || quantity.pack.purchases.where(user_id: user.id).any? ) && user.id
                break unless accessible
            end
            accessible
        end
        can :read, Equation do |equation|
            ( equation.quantity.pack.price == 0 || equation.quantity.pack.purchases.where(user_id: user.id).any? ) && user.id
        end

    end

end
