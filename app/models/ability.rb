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
            quantity.pack.price == 0 || user.id && quantity.pack.purchases.where(user: user).any?
        end
        can :read, Constant do |constant|
            constant.pack.price == 0 || user.id && constant.pack.purchases.where(user: user).any?
        end
        can :read, UnitOfMeasurement do |unit_of_measurement|
            accessible = true
            unit_of_measurement.quantities.each do |quantity|
                accessible = quantity.pack.price == 0 || user.id && quantity.pack.purchases.where(user: user).any?
                break if accessible
            end
            accessible
        end
        can :read, Equation do |equation|
            equation.quantity.pack.price == 0 || user.id && equation.quantity.pack.purchases.where(user: user).any?
        end

    end

end
